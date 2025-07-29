defmodule DemostarterWeb.Components.Lego.BaseWidget do
  @moduledoc """
  Base LEGO widget component with compile-time size validation.
  
  This component enforces the LEGO grid system constraints and provides
  a consistent structure for all widgets in the system. In the widget-only
  approach, this base widget is primarily used for layout containers that
  hold other widgets - not for direct content.
  """
  
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.Validation
  
  # Define all valid widget sizes at compile time
  @valid_sizes ~w(1x1 2x1 2x2 3x1 3x2 4x1 4x2 6x1 6x2 12x1 12x2)
  
  @doc """
  Base LEGO widget component.
  
  ## Attributes
  - `size` (required): Widget size in "columns x rows" format. Must be one of: #{inspect(@valid_sizes)}
  - `title`: Optional widget title
  - `id`: DOM element ID
  - `class`: Additional CSS classes
  - `loading`: Show loading state
  - `error`: Error message to display
  
  ## Slots
  - `inner_block` (required): Other widgets only - no raw HTML/CSS
  - `actions`: Widget components for header actions
  - `footer`: Widget components for footer
  
  ## Examples
  
      <!-- Phase 1: Raw HTML inside widgets (temporary) -->
      <.lego_widget size="2x1" title="Revenue">
        <div class="text-2xl font-bold">$42,000</div>
      </.lego_widget>
      
      <!-- Phase 2 will replace with: -->
      <!-- <.card_widget size="2x1" title="Revenue">
        <.text_widget size="2xl" weight="bold">$42,000</.text_widget>
      </.card_widget> -->
  """
  attr :id, :string, default: nil
  attr :size, :string, 
    required: true,
    values: @valid_sizes,
    doc: "Widget size in columns x rows format"
  
  attr :title, :string, default: nil
  attr :class, :string, default: nil
  attr :loading, :boolean, default: false
  attr :error, :string, default: nil
  attr :rest, :global
  
  slot :inner_block, required: true
  slot :actions
  slot :footer
  
  def lego_widget(assigns) do
    # Validate size at compile time if it's a literal string
    # This will cause compilation to fail if an invalid size is used
    validate_widget_size!(assigns.size)
    
    ~H"""
    <div
      id={@id}
      class={[
        "lego-widget",
        "lego-#{@size}",
        @loading && "lego-widget-loading",
        @error && "lego-widget-error",
        @class
      ]}
      {@rest}
    >
      <div :if={@title || @actions != []} class="lego-widget-header">
        <h3 :if={@title} class="lego-widget-title"><%= @title %></h3>
        <div :if={@actions != []} class="lego-widget-actions">
          <%= render_slot(@actions) %>
        </div>
      </div>
      
      <div class="lego-widget-content">
        <div :if={@loading} class="lego-widget-loader">
          <span class="loading loading-spinner loading-lg"></span>
        </div>
        
        <div :if={@error} class="lego-widget-error-message">
          <div class="alert alert-error">
            <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span><%= @error %></span>
          </div>
        </div>
        
        <div :if={!@loading && !@error}>
          <%= render_slot(@inner_block) %>
        </div>
      </div>
      
      <div :if={@footer != []} class="lego-widget-footer">
        <%= render_slot(@footer) %>
      </div>
    </div>
    """
  end
end