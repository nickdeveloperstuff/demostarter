defmodule DemostarterWeb.Components.Lego.Widgets.Metric do
  @moduledoc """
  Metric display widgets for the LEGO system.
  """
  
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.BaseWidget
  
  @doc """
  Simple metric widget with value and optional trend.
  """
  attr :title, :string, required: true
  attr :value, :string, required: true
  attr :size, :string, default: "2x1"
  attr :trend, :atom, values: [nil, :up, :down, :neutral], default: nil
  attr :trend_value, :string, default: nil
  attr :icon, :string, default: nil
  
  def metric(assigns) do
    ~H"""
    <.lego_widget size={@size} title={@title}>
      <div class="flex items-center justify-between h-full">
        <div class="flex-1">
          <div class="text-3xl font-bold"><%= @value %></div>
          <div :if={@trend && @trend_value} class={[
            "text-sm font-medium",
            @trend == :up && "text-success",
            @trend == :down && "text-error",
            @trend == :neutral && "text-base-content/60"
          ]}>
            <span :if={@trend == :up}>↑</span>
            <span :if={@trend == :down}>↓</span>
            <span :if={@trend == :neutral}>→</span>
            <%= @trend_value %>
          </div>
        </div>
        <div :if={@icon} class="text-4xl opacity-20">
          <%= @icon %>
        </div>
      </div>
    </.lego_widget>
    """
  end
  
  @doc """
  Comparison metric widget showing current vs previous values.
  """
  attr :title, :string, required: true
  attr :current, :string, required: true
  attr :previous, :string, required: true
  attr :size, :string, default: "3x1"
  attr :format, :atom, values: [:currency, :number, :percentage], default: :number
  
  def comparison(assigns) do
    ~H"""
    <.lego_widget size={@size} title={@title}>
      <div class="flex items-center justify-around h-full">
        <div class="text-center">
          <div class="text-xs uppercase opacity-60 mb-1">Current</div>
          <div class="text-2xl font-bold text-primary"><%= @current %></div>
        </div>
        <div class="text-2xl opacity-20">→</div>
        <div class="text-center">
          <div class="text-xs uppercase opacity-60 mb-1">Previous</div>
          <div class="text-2xl font-bold opacity-60"><%= @previous %></div>
        </div>
      </div>
    </.lego_widget>
    """
  end
end