defmodule DemostarterWeb.Components.Lego.Containers do
  @moduledoc """
  LEGO container components for grid layouts and sections.
  """
  
  use Phoenix.Component
  
  @doc """
  Main LEGO grid container.
  
  Creates a 12-column responsive grid container for widgets.
  
  ## Examples
  
      <.lego_container>
        <.lego_widget size="2x1" title="Widget 1">Content</.lego_widget>
        <.lego_widget size="2x1" title="Widget 2">Content</.lego_widget>
      </.lego_container>
  """
  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :fluid, :boolean, default: false, doc: "Remove max-width constraint"
  slot :inner_block, required: true
  
  def lego_container(assigns) do
    ~H"""
    <div 
      id={@id} 
      class={[
        "lego-container",
        @fluid && "lego-container-fluid",
        @class
      ]}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
  
  @doc """
  LEGO section with title and optional description.
  
  ## Examples
  
      <.lego_section title="Dashboard Metrics" description="Key performance indicators">
        <.lego_widget size="2x1" title="Revenue">$42K</.lego_widget>
      </.lego_section>
  """
  attr :title, :string, required: true
  attr :description, :string, default: nil
  attr :class, :string, default: nil
  slot :inner_block, required: true
  slot :actions
  
  def lego_section(assigns) do
    ~H"""
    <section class={["lego-section", @class]}>
      <div class="lego-section-header">
        <div>
          <h2 class="lego-section-title"><%= @title %></h2>
          <p :if={@description} class="lego-section-description">
            <%= @description %>
          </p>
        </div>
        <div :if={@actions != []} class="lego-section-actions">
          <%= render_slot(@actions) %>
        </div>
      </div>
      <.lego_container>
        <%= render_slot(@inner_block) %>
      </.lego_container>
    </section>
    """
  end
  
  @doc """
  LEGO page layout wrapper.
  
  Provides consistent page structure with optional sidebar.
  """
  attr :title, :string, required: true
  attr :breadcrumbs, :list, default: []
  slot :inner_block, required: true
  slot :sidebar
  slot :header_actions
  
  def lego_page(assigns) do
    ~H"""
    <div class="lego-page">
      <header class="lego-page-header">
        <div class="lego-page-header-content">
          <div>
            <nav :if={@breadcrumbs != []} class="breadcrumbs text-sm">
              <ul>
                <li :for={crumb <- @breadcrumbs}>
                  <.link :if={crumb[:url]} navigate={crumb.url}>
                    <%= crumb.label %>
                  </.link>
                  <span :if={!crumb[:url]}><%= crumb.label %></span>
                </li>
              </ul>
            </nav>
            <h1 class="lego-page-title"><%= @title %></h1>
          </div>
          <div :if={@header_actions != []} class="lego-page-actions">
            <%= render_slot(@header_actions) %>
          </div>
        </div>
      </header>
      
      <div class="lego-page-body">
        <aside :if={@sidebar != []} class="lego-page-sidebar">
          <%= render_slot(@sidebar) %>
        </aside>
        <main class="lego-page-main">
          <%= render_slot(@inner_block) %>
        </main>
      </div>
    </div>
    """
  end
end