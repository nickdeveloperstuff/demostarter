defmodule DemostarterWeb.Test.DynamicContentLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(3000, self(), :update_content)
    end

    socket =
      socket
      |> assign(:counter, 0)
      |> assign(:items, generate_items(3))
      |> assign(:show_wide_content, false)
      |> assign(:grid_columns, 2)

    {:ok, socket}
  end

  def handle_info(:update_content, socket) do
    # Automatically add a new item every 3 seconds
    new_item = %{
      id: System.unique_integer([:positive]),
      content: "Auto-generated item #{socket.assigns.counter + 1}",
      color: Enum.random(["primary", "secondary", "accent", "info", "success", "warning"])
    }

    {:noreply,
     socket
     |> update(:counter, &(&1 + 1))
     |> update(:items, &(&1 ++ [new_item]))}
  end

  def handle_event("add_item", _params, socket) do
    new_item = %{
      id: System.unique_integer([:positive]),
      content: "Dynamic item #{length(socket.assigns.items) + 1}",
      color: Enum.random(["primary", "secondary", "accent", "info", "success", "warning"])
    }

    {:noreply, update(socket, :items, &(&1 ++ [new_item]))}
  end

  def handle_event("remove_item", %{"id" => id}, socket) do
    id = String.to_integer(id)
    {:noreply, update(socket, :items, &Enum.reject(&1, fn item -> item.id == id end))}
  end

  def handle_event("toggle_wide_content", _params, socket) do
    {:noreply, update(socket, :show_wide_content, &(!&1))}
  end

  def handle_event("change_grid", %{"columns" => columns}, socket) do
    {:noreply, assign(socket, :grid_columns, String.to_integer(columns))}
  end

  def handle_event("reset", _params, socket) do
    {:noreply,
     socket
     |> assign(:items, generate_items(3))
     |> assign(:show_wide_content, false)
     |> assign(:grid_columns, 2)}
  end

  defp generate_items(count) do
    for i <- 1..count do
      %{
        id: i,
        content: "Initial item #{i}",
        color: Enum.random(["primary", "secondary", "accent", "info", "success", "warning"])
      }
    end
  end

  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-3xl font-bold mb-8">Dynamic Content Test Page</h1>

      <div class="mb-8 bg-base-200 p-4 rounded">
        <p class="text-sm mb-2">
          This page tests that layout constraints are maintained during LiveView updates.
        </p>
        <p class="text-sm">
          Auto-update counter: <span class="font-bold"><%= @counter %></span> (updates every 3 seconds)
        </p>
      </div>
      
    <!-- Control Panel -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Controls</h2>
        <div class="flex flex-wrap gap-4">
          <button phx-click="add_item" class="btn btn-primary">
            Add Item
          </button>

          <button phx-click="toggle_wide_content" class="btn btn-secondary">
            Toggle Wide Content
          </button>

          <select phx-change="change_grid" name="columns" class="select select-bordered">
            <option value="1">1 Column</option>
            <option value="2" selected={@grid_columns == 2}>2 Columns</option>
            <option value="3" selected={@grid_columns == 3}>3 Columns</option>
            <option value="4" selected={@grid_columns == 4}>4 Columns</option>
          </select>

          <button phx-click="reset" class="btn btn-neutral">
            Reset All
          </button>
        </div>
      </section>
      
    <!-- Wide Content Test -->
      <%= if @show_wide_content do %>
        <section class="mb-8">
          <h2 class="text-xl font-semibold mb-4">Wide Content (Dynamically Added)</h2>
          <div style="width: 2500px; height: 150px; background: linear-gradient(90deg, #ff6b6b, #4ecdc4, #45b7d1, #f7b731, #5f27cd); display: flex; align-items: center; justify-content: center; color: white; font-size: 24px; font-weight: bold;">
            This 2500px wide content was dynamically added
          </div>
        </section>
      <% end %>
      
    <!-- Dynamic Grid -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Dynamic Grid (Currently <%= @grid_columns %> columns)</h2>
        <div class={"grid gap-4 grid-cols-#{@grid_columns}"}>
          <%= for item <- @items do %>
            <div class={"bg-#{item.color} text-#{item.color}-content p-4 rounded relative group"}>
              <p class="mb-2"><%= item.content %></p>
              <button
                phx-click="remove_item"
                phx-value-id={item.id}
                class="absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity btn btn-xs btn-circle"
              >
                ×
              </button>
              <div class="text-xs opacity-75">ID: <%= item.id %></div>
            </div>
          <% end %>
        </div>
      </section>
      
    <!-- Live Updating Table -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Live Updating Table</h2>
        <div class="overflow-x-auto">
          <table class="table table-zebra">
            <thead>
              <tr>
                <th>ID</th>
                <th>Content</th>
                <th>Color</th>
                <th>Timestamp</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <%= for item <- @items do %>
                <tr>
                  <td><%= item.id %></td>
                  <td><%= item.content %></td>
                  <td>
                    <span class={"badge badge-#{item.color}"}>
                      <%= item.color %>
                    </span>
                  </td>
                  <td><%= DateTime.utc_now() |> DateTime.to_string() %></td>
                  <td>
                    <button
                      phx-click="remove_item"
                      phx-value-id={item.id}
                      class="btn btn-xs btn-error"
                    >
                      Remove
                    </button>
                  </td>
                </tr>
              <% end %>
            </tbody>
          </table>
        </div>
      </section>
      
    <!-- Animation Test -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">CSS Animation Test</h2>
        <div class="flex gap-4 overflow-hidden">
          <div class="animate-pulse bg-primary p-4 rounded text-primary-content">
            Pulsing
          </div>
          <div class="animate-spin bg-secondary p-4 rounded text-secondary-content">
            Spinning
          </div>
          <div class="animate-bounce bg-accent p-4 rounded text-accent-content">
            Bouncing
          </div>
        </div>
      </section>
    </div>
    """
  end
end
