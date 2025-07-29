defmodule DemostarterWeb.Components.Lego.Layouts do
  @moduledoc """
  High-level layout components for common page patterns.
  """
  
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.Containers
  import DemostarterWeb.Components.Lego.BaseWidget
  
  @doc """
  Dashboard layout with predefined sections.
  
  ## Examples
  
      <.dashboard_layout title="Analytics Dashboard">
        <:metrics>
          <.lego_widget size="2x1" title="Revenue">$42K</.lego_widget>
        </:metrics>
        <:charts>
          <.lego_widget size="6x2" title="Sales Trend">Chart</.lego_widget>
        </:charts>
      </.dashboard_layout>
  """
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  
  slot :header_actions
  slot :metrics, doc: "Key metric widgets"
  slot :charts, doc: "Chart visualizations"
  slot :lists, doc: "Data tables and lists"
  slot :sidebar, doc: "Sidebar content"
  
  def dashboard_layout(assigns) do
    ~H"""
    <.lego_page title={@title}>
      <:header_actions>
        <%= render_slot(@header_actions) %>
      </:header_actions>
      
      <:sidebar :if={@sidebar != []}>
        <%= render_slot(@sidebar) %>
      </:sidebar>
      
      <div class="lego-dashboard">
        <div :if={@metrics != []} class="lego-dashboard-metrics">
          <.lego_section title="Key Metrics">
            <%= render_slot(@metrics) %>
          </.lego_section>
        </div>
        
        <div :if={@charts != []} class="lego-dashboard-charts">
          <.lego_section title="Analytics">
            <%= render_slot(@charts) %>
          </.lego_section>
        </div>
        
        <div :if={@lists != []} class="lego-dashboard-lists">
          <.lego_section title="Recent Activity">
            <%= render_slot(@lists) %>
          </.lego_section>
        </div>
      </div>
    </.lego_page>
    """
  end
  
  @doc """
  Form layout with consistent structure.
  """
  attr :title, :string, required: true
  attr :description, :string, default: nil
  
  slot :form, required: true
  slot :sidebar
  slot :actions
  
  def form_layout(assigns) do
    ~H"""
    <.lego_page title={@title}>
      <div class="lego-form-layout">
        <div class="lego-form-main">
          <.lego_widget size="12x2" title={@title}>
            <p :if={@description} class="text-base-content/60 mb-6">
              <%= @description %>
            </p>
            <%= render_slot(@form) %>
            <:footer :if={@actions != []}>
              <div class="flex justify-end gap-2">
                <%= render_slot(@actions) %>
              </div>
            </:footer>
          </.lego_widget>
        </div>
        
        <div :if={@sidebar != []} class="lego-form-sidebar">
          <%= render_slot(@sidebar) %>
        </div>
      </div>
    </.lego_page>
    """
  end
end