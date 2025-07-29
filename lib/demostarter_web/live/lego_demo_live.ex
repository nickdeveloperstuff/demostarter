defmodule DemostarterWeb.LegoDemoLive do
  @moduledoc """
  Interactive demonstration of the LEGO UI system components.
  """
  
  use DemostarterWeb, :live_view
  
  import DemostarterWeb.Components.Lego.BaseWidget
  import DemostarterWeb.Components.Lego.Containers
  
  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:selected_size, "2x1")
     |> assign(:show_grid, true)
     |> assign(:theme, "lego")}
  end
  
  @impl true
  def render(assigns) do
    ~H"""
    <.lego_page title="LEGO UI System Demo">
      <:header_actions>
        <label class="flex items-center gap-2">
          <input 
            type="checkbox" 
            class="toggle toggle-primary" 
            checked={@show_grid}
            phx-click="toggle_grid"
          />
          <span>Show Grid</span>
        </label>
        
        <select class="select select-bordered select-sm" phx-change="change_theme">
          <option value="lego" selected={@theme == "lego"}>Light Theme</option>
          <option value="dark" selected={@theme == "dark"}>Dark Theme</option>
        </select>
      </:header_actions>
      
      <.lego_section title="Widget Size Gallery" description="All available widget sizes in the LEGO system">
        <.lego_widget size="1x1" title="1x1 Widget">
          <div class="text-center">
            <div class="text-2xl font-bold">42</div>
            <div class="text-xs opacity-60">Active</div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="2x1" title="2x1 Widget">
          <div class="flex items-center justify-between">
            <div>
              <div class="text-2xl font-bold">$12,345</div>
              <div class="text-sm opacity-60">Monthly Revenue</div>
            </div>
            <div class="text-success">+12%</div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="2x2" title="2x2 Widget">
          <:actions>
            <button class="btn btn-xs btn-ghost">Export</button>
          </:actions>
          <div class="space-y-2">
            <div class="text-3xl font-bold">Analytics</div>
            <div class="space-y-1">
              <div class="flex justify-between">
                <span>Users</span>
                <span class="font-semibold">1,234</span>
              </div>
              <div class="flex justify-between">
                <span>Sessions</span>
                <span class="font-semibold">5,678</span>
              </div>
              <div class="flex justify-between">
                <span>Pageviews</span>
                <span class="font-semibold">12,345</span>
              </div>
            </div>
          </div>
          <:footer>
            <span class="text-xs">Updated 5 min ago</span>
          </:footer>
        </.lego_widget>
        
        <.lego_widget size="3x1" title="3x1 Widget">
          <div class="flex items-center gap-4">
            <div class="avatar">
              <div class="w-12 rounded-full bg-primary text-primary-content">
                <span class="text-xl">U</span>
              </div>
            </div>
            <div class="flex-1">
              <div class="font-semibold">User Activity</div>
              <div class="text-sm opacity-60">Last seen 2 hours ago</div>
            </div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="3x2" title="3x2 Widget">
          <div class="space-y-3">
            <div class="text-lg font-semibold">Recent Orders</div>
            <div class="space-y-2">
              <div class="p-2 bg-base-200 rounded">Order #1234</div>
              <div class="p-2 bg-base-200 rounded">Order #1235</div>
              <div class="p-2 bg-base-200 rounded">Order #1236</div>
            </div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="4x1" title="4x1 Widget">
          <div class="flex items-center justify-between">
            <div class="flex items-center gap-4">
              <div class="text-4xl">📊</div>
              <div>
                <div class="font-semibold">Performance Dashboard</div>
                <div class="text-sm opacity-60">Real-time metrics</div>
              </div>
            </div>
            <button class="btn btn-primary btn-sm">View Details</button>
          </div>
        </.lego_widget>
        
        <.lego_widget size="4x2" title="4x2 Widget">
          <div class="flex items-center justify-center h-full">
            <div class="text-center">
              <div class="text-6xl mb-2">📈</div>
              <div class="text-xl font-semibold">Chart Widget</div>
              <div class="opacity-60">Perfect for visualizations</div>
            </div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="6x1" title="6x1 Widget">
          <div class="flex items-center justify-between">
            <div class="flex items-center gap-6">
              <div class="stat">
                <div class="stat-title">Total Users</div>
                <div class="stat-value text-primary">89,400</div>
              </div>
              <div class="stat">
                <div class="stat-title">Revenue</div>
                <div class="stat-value text-secondary">$42,000</div>
              </div>
              <div class="stat">
                <div class="stat-title">Growth</div>
                <div class="stat-value text-accent">+12%</div>
              </div>
            </div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="6x2" title="6x2 Widget">
          <div class="overflow-x-auto">
            <table class="table table-zebra">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Status</th>
                  <th>Date</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>John Doe</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>2024-01-15</td>
                  <td><button class="btn btn-xs">Edit</button></td>
                </tr>
                <tr>
                  <td>Jane Smith</td>
                  <td><span class="badge badge-warning">Pending</span></td>
                  <td>2024-01-14</td>
                  <td><button class="btn btn-xs">Edit</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </.lego_widget>
        
        <.lego_widget size="12x1" title="12x1 Widget - Full Width">
          <div class="flex items-center justify-center">
            <div class="text-center">
              <div class="text-2xl font-bold mb-2">Full Width Widget</div>
              <div class="opacity-60">Perfect for notifications, banners, or full-width content</div>
            </div>
          </div>
        </.lego_widget>
        
        <.lego_widget size="12x2" title="12x2 Widget - Full Width Extended">
          <div class="grid grid-cols-3 gap-4">
            <div class="text-center p-4 bg-base-200 rounded">
              <div class="text-4xl mb-2">🎯</div>
              <div class="font-semibold">Goal Setting</div>
              <div class="text-sm opacity-60">Define your objectives</div>
            </div>
            <div class="text-center p-4 bg-base-200 rounded">
              <div class="text-4xl mb-2">📊</div>
              <div class="font-semibold">Analytics</div>
              <div class="text-sm opacity-60">Track performance</div>
            </div>
            <div class="text-center p-4 bg-base-200 rounded">
              <div class="text-4xl mb-2">🚀</div>
              <div class="font-semibold">Growth</div>
              <div class="text-sm opacity-60">Scale your business</div>
            </div>
          </div>
        </.lego_widget>
      </.lego_section>
      
      <.lego_section title="Interactive Examples" description="Components with loading and error states">
        <.lego_widget size="3x2" title="Loading State" loading={true}>
          This content won't be shown
        </.lego_widget>
        
        <.lego_widget size="3x2" title="Error State" error="Failed to load data">
          This content won't be shown
        </.lego_widget>
        
        <.lego_widget size="3x2" title="Interactive Widget">
          <div class="space-y-3">
            <button class="btn btn-primary btn-block" phx-click="action_clicked">
              Click Me
            </button>
            <div class="text-center opacity-60">
              Interactive elements work normally
            </div>
          </div>
        </.lego_widget>
      </.lego_section>
    </.lego_page>
    """
  end
  
  @impl true
  def handle_event("toggle_grid", _params, socket) do
    {:noreply, assign(socket, :show_grid, !socket.assigns.show_grid)}
  end
  
  @impl true
  def handle_event("change_theme", %{"value" => theme}, socket) do
    {:noreply, assign(socket, :theme, theme)}
  end
  
  @impl true
  def handle_event("action_clicked", _params, socket) do
    {:noreply, put_flash(socket, :info, "Button clicked!")}
  end
end