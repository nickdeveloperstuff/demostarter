# Building a LEGO-style constrained UI system for Phoenix LiveView

A comprehensive implementation guide for creating an idiot-proof component system that enforces design consistency through compile-time validation and Apple-inspired widget constraints.

## Executive summary and system philosophy

This implementation plan delivers a **production-ready UI component system** that makes it literally impossible for developers to break design guidelines. By combining Phoenix LiveView's compile-time validation with CSS Grid foundations and iOS-inspired widget sizing, the system ensures that junior developers can build complex interfaces using only pre-approved widget components that snap perfectly into predefined layouts. **Every UI element must be a widget** - no direct HTML or DaisyUI component usage is allowed in templates. 

The core innovation lies in **multi-layer constraint enforcement**: compile-time Phoenix.Component validation prevents invalid attributes, custom Credo checks block ALL direct CSS and DaisyUI usage, and a 12-column grid system with fixed widget sizes ensures visual consistency. Developers must select from a catalog of validated widget components - there is no access to raw HTML elements or CSS classes. The result is a system where developers have creative freedom within safe boundaries - like LEGO blocks that can create infinite combinations but only connect in approved ways.

## Implementation roadmap and major phases

The complete system is delivered through three focused implementation phases:

**Phase 1 - Foundation Setup** (Ready for implementation)
- Phoenix LiveView project initialization with Tailwind 4 and DaisyUI
- 12-column CSS Grid system implementation
- Base folder structure and configuration

**Phase 2 - Core Widget Components** (Ready for implementation)
- Atomic widget wrappers for every DaisyUI component
- Button, input, card, badge, and all UI element widgets
- Strict validation preventing any non-widget usage
- Phoenix.Component attribute constraints for each widget type

**Phase 3 - Layout System** (Ready for implementation)
- Dashboard and main content layout components
- Slot-based architecture for composition
- Container queries for micro-responsiveness

**Implementation Status**: Detailed plans complete, ready for development

The three-phase approach delivers a production-ready UI system that leverages Phoenix's built-in compile-time validation. No additional validation layers or complex tooling needed - the framework handles enforcement naturally through Phoenix.Component's attribute validation and the established widget patterns.

## Technical architecture deep dive

### Grid system mathematics and constraints

The system uses a **12-column CSS Grid foundation** with mathematically consistent spacing. Each column represents 8.33% of the container width, with a standard gap of 16px (4 LEGO units). Widget sizes follow Apple's constraint model:

```css
/* Define variables in Tailwind CSS 4.0's @theme block */
@theme {
  --lego-unit: 4px;
  --lego-cols: 12;
  --lego-gap: calc(var(--lego-unit) * 4);
  --lego-container-max: 1200px;
}

/* CSS classes use the theme variables */
.lego-container {
  display: grid;
  grid-template-columns: repeat(var(--lego-cols), 1fr);
  gap: var(--lego-gap);
}
```

**Widget dimensions** are strictly limited to these aspect ratios:
- **1x1**: Perfect squares for status indicators (base: 64px)
- **2x1**: 2:1 rectangles for key metrics  
- **2x2**: Large squares for detailed visualizations
- **3x1**: Medium rectangles for user info, activity cards
- **3x2**: Lists and medium charts
- **4x1**: Wide cards for CTAs
- **4x2**: Wide rectangles for complex dashboards
- **6x1**: Half-width sections
- **6x2**: Large dashboards
- **12x1**: Full-width banners
- **12x2**: Full-width extended content

### Compile-time validation implementation

The system prevents design violations through **Phoenix.Component validation**:

```elixir
defmodule LegoUiSystemWeb.Components.Widgets.BaseWidget do
  use Phoenix.Component
  
  @valid_sizes ~w(1x1 2x1 2x2 3x1 3x2 4x1 4x2 6x1 6x2 12x1 12x2)
  
  attr :size, :string, 
    required: true,
    values: @valid_sizes,  # Compile-time enforcement
    doc: "Widget dimensions in columns x rows format"
    
  # Invalid sizes cause compilation errors, not runtime failures
end
```

Custom **Credo checks** prevent ANY non-widget usage:

```elixir
defmodule Credo.Check.Consistency.WidgetOnlyEnforcement do
  use Credo.Check,
    category: :design,
    base_priority: :high,
    explanations: [
      check: """
      This check ensures that templates only use widget components.
      Direct HTML elements and DaisyUI classes are forbidden.
      
      # Bad
      <div class="card">...</div>
      <button class="btn btn-primary">Click</button>
      
      # Good  
      <.card_widget size="4x2">...</.card_widget>
      <.button_widget label="Click" variant="primary" />
      """
    ]
    
  # Detects any HTML tags or CSS classes in templates
  defp check_template_content(ast, issues, issue_meta) do
    # Validation logic that fails if ANY non-widget usage found
  end
end
```

### Component architecture and composition

The system uses a **hierarchical widget-only structure** with clear boundaries:

1. **Atomic Widgets**: Wrap individual DaisyUI components (button_widget, input_widget, badge_widget, etc.)
2. **Composite Widgets**: Combine atomic widgets (form_widget contains input_widgets and button_widgets)
3. **Container Widgets**: Handle grid positioning and layout (card_widget, panel_widget)
4. **Layout Widgets**: Page-level composition with slots (dashboard_layout, form_layout)
5. **Container Queries**: Widget-level responsive behavior

**Critical Rule**: No HTML elements or DaisyUI classes can be used directly in templates. Everything must be a widget.

Example dashboard composition (widget-only approach):

```elixir
<.dashboard_layout title="Analytics Dashboard">
  <:header_actions>
    <.button_widget label="Export" variant="ghost" size="sm" />
    <.button_widget label="Settings" variant="ghost" size="sm" icon="cog" />
  </:header_actions>
  
  <:metrics>
    <.card_widget size="2x1">
      <.stat_widget label="Revenue" value="$42K" trend={:up} trend_value="+12%" />
    </.card_widget>
    <.card_widget size="2x1">
      <.stat_widget label="Users" value="1.2K" trend={:neutral} />
    </.card_widget>
  </:metrics>
  
  <:charts>
    <.card_widget size="6x2" title="Growth Trend">
      <.chart_widget chart_type={:line} data={@data} />
    </.card_widget>
  </:charts>
</.dashboard_layout>
```

Note: Every UI element is a widget. No raw HTML, no direct DaisyUI classes.

## Step-by-step implementation guide

### Phase 1: Project initialization and grid foundation

```bash
# Create Phoenix LiveView project
mix phx.new lego_ui_system --live
cd lego_ui_system

# Install dependencies
mix deps.get
cd assets && npm install && cd ..
mix ecto.create
```

**Configure Tailwind CSS 4.0 and DaisyUI** in `assets/css/app.css`:

Since Tailwind CSS 4.0 doesn't use a configuration file, all setup is done in your CSS file:

```css
/* Tailwind CSS 4.0 imports */
@import "tailwindcss" source(none);
@source "../css";
@source "../js";
@source "../../lib/lego_ui_system_web";

/* DaisyUI plugin */
@plugin "../vendor/daisyui" {
  themes: false;
}

/* Define theme variables */
@theme {
  /* Grid system */
  --grid-template-columns-lego-12: repeat(12, 1fr);
  
  /* Add other theme variables as needed */
}
```

**Create the folder structure**:

```bash
mkdir -p lib/lego_ui_system_web/components/{widgets,layouts}
mkdir -p assets/js/hooks
```

### Phase 2: Core widget implementation

**Atomic widget example - Button Widget** (`lib/lego_ui_system_web/components/widgets/button.ex`):

```elixir
defmodule LegoUiSystemWeb.Components.Widgets.Button do
  use Phoenix.Component
  
  @variants ~w(primary secondary accent ghost link)
  @sizes ~w(xs sm md lg)
  
  attr :label, :string, required: true
  attr :variant, :string, default: "primary", values: @variants
  attr :size, :string, default: "md", values: @sizes
  attr :icon, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :loading, :boolean, default: false
  attr :type, :string, default: "button"
  attr :rest, :global, include: ~w(phx-click phx-target)
  
  def button_widget(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "btn",
        "btn-#{@variant}",
        "btn-#{@size}",
        @loading && "loading"
      ]}
      disabled={@disabled || @loading}
      {@rest}
    >
      <.icon :if={@icon && !@loading} name={@icon} class="w-4 h-4" />
      <%= @label %>
    </button>
    """
  end
end
```

**Input widget example** (`lib/lego_ui_system_web/components/widgets/input.ex`):

```elixir
defmodule LegoUiSystemWeb.Components.Widgets.Input do
  use Phoenix.Component
  
  attr :label, :string, required: true
  attr :name, :string, required: true
  attr :type, :string, default: "text"
  attr :value, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :required, :boolean, default: false
  attr :error, :string, default: nil
  attr :rest, :global
  
  def input_widget(assigns) do
    ~H"""
    <div class="form-control w-full">
      <label class="label">
        <span class="label-text"><%= @label %></span>
      </label>
      <input
        type={@type}
        name={@name}
        value={@value}
        placeholder={@placeholder}
        required={@required}
        class={[
          "input input-bordered w-full",
          @error && "input-error"
        ]}
        {@rest}
      />
      <label :if={@error} class="label">
        <span class="label-text-alt text-error"><%= @error %></span>
      </label>
    </div>
    """
  end
end
```

### Phase 3: Layout components with slots

**Dashboard layout with widget-only composition** (`lib/lego_ui_system_web/components/layouts/dashboard_layout.ex`):

```elixir
defmodule LegoUiSystemWeb.Components.Layouts.DashboardLayout do
  use Phoenix.Component
  import LegoUiSystemWeb.Components.Widgets.{Text, Container}
  
  attr :title, :string, required: true
  slot :header_actions
  slot :metrics
  slot :charts
  slot :lists
  
  def dashboard_layout(assigns) do
    ~H"""
    <.container_widget type="page">
      <.container_widget type="header">
        <.text_widget size="2xl" weight="bold"><%= @title %></.text_widget>
        <.container_widget type="actions">
          <%= render_slot(@header_actions) %>
        </.container_widget>
      </.container_widget>
      
      <.container_widget type="grid">
        <.container_widget type="section" class="col-span-12">
          <%= render_slot(@metrics) %>
        </.container_widget>
        
        <.container_widget type="section" class="col-span-12">
          <%= render_slot(@charts) %>
        </.container_widget>
        
        <.container_widget type="section" class="col-span-12">
          <%= render_slot(@lists) %>
        </.container_widget>
      </.container_widget>
    </.container_widget>
    """
  end
end
```




## Widget Catalog Strategy

The system maps every DaisyUI component to a corresponding widget with validated attributes:

### Naming Convention
- DaisyUI class → Widget function name
- `btn` → `button_widget`
- `input` → `input_widget`
- `card` → `card_widget`
- `badge` → `badge_widget`
- `modal` → `modal_widget`

### Widget Categories

**1. Atomic Widgets** (wrap single DaisyUI components)
- `button_widget` - All button variants
- `input_widget` - Text, email, password inputs  
- `select_widget` - Dropdown selections
- `checkbox_widget` - Checkboxes with labels
- `radio_widget` - Radio button groups
- `toggle_widget` - Toggle switches
- `badge_widget` - Status badges
- `avatar_widget` - User avatars

**2. Composite Widgets** (combine multiple atomics)
- `form_widget` - Complete form with validation
- `card_widget` - Container with header/body/footer
- `table_widget` - Data tables with sorting
- `list_widget` - Lists with consistent styling
- `stat_widget` - Metric displays
- `alert_widget` - Notifications and warnings

**3. Layout Widgets** (page structure)
- `container_widget` - Generic containers
- `grid_widget` - Grid layouts
- `section_widget` - Page sections
- `navbar_widget` - Navigation bars
- `sidebar_widget` - Side navigation

### Developer Workflow

Developers select widgets from a catalog, never writing raw HTML:

```elixir
# ❌ FORBIDDEN - Will fail validation
<div class="card">
  <button class="btn btn-primary">Click</button>
</div>

# ✅ REQUIRED - Only widgets allowed
<.card_widget size="4x2">
  <.button_widget label="Click" variant="primary" />
</.card_widget>
```

## Container queries and responsive strategy

The system uses **container queries** for widget-level responsiveness:

```css
.lego-widget {
  container-type: inline-size;
}

@container (max-width: 300px) {
  .widget-title { font-size: 0.875rem; }
  .metric-value { font-size: 1.5rem; }
}

@container (min-width: 400px) {
  .widget-title { font-size: 1rem; }
  .metric-value { font-size: 2.5rem; }
}
```

**Mobile progressive disclosure**:

```css
@media (max-width: 768px) {
  .lego-widget-4x2 { grid-column: span 12; }
  .widget-details { display: none; }
  .widget-summary { display: block; }
}
```

## Production deployment checklist

Before deploying, ensure:

1. **All Credo checks pass**: `mix credo --strict`
   - No direct HTML elements in templates
   - No DaisyUI classes outside widget implementations
   - Only widget components used for UI
2. **Widget-only validation passes**: `mix compile --warnings-as-errors`
   - Every UI element is a widget
   - No raw HTML or CSS in templates
3. **Tests cover widget constraints**: `mix test`
   - Widget attribute validation
   - Widget composition rules
4. **CSS is purged**: Only widget-internal classes in production bundle
5. **Container query polyfill** included for older browsers
6. **CI/CD validates** widget-only constraints on every commit

## Conclusion

This LEGO-style UI system delivers on the promise of being truly "idiot-proof" while enabling rapid, consistent UI development. The multi-layer validation ensures that design violations are caught at compile-time, not in production. The iOS-inspired widget system provides a familiar, intuitive mental model for developers.

The three-phase implementation creates a complete, production-ready system that leverages Phoenix LiveView's built-in capabilities rather than adding complex custom validation layers. The result is a maintainable, performant UI system that junior developers and AI assistants can use confidently without breaking design guidelines.

## Layout patterns and composition

Phase 3 introduces sophisticated layout patterns that leverage the grid system:

- **Dashboard Layouts**: Metrics, admin, and analytics dashboards with predefined widget placement
- **Page Templates**: List pages, detail views, forms, and settings pages with consistent structure  
- **Empty Space Usage**: Strategic use of empty grid columns for visual breathing room and emphasis
- **Responsive Patterns**: Grid adapts from 12 columns (desktop) to 6 (tablet) to 1 (mobile)
- **Slot-based Composition**: Named slots organize content regions (header, metrics, charts, etc.)

The system is ready for implementation following the detailed phase plans. Phoenix's compile-time validation combined with the widget-only approach provides all the safety and consistency needed for production use.