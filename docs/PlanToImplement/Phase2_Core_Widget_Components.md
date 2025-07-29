# PHASE 2: CORE WIDGET COMPONENTS - DETAILED IMPLEMENTATION PLAN

## Overview

This document provides a comprehensive implementation plan for Phase 2 of the LEGO-style UI system. Building on Phase 1's foundation, Phase 2 implements the "everything-is-a-widget" philosophy by creating widget wrappers for essential UI components. Every UI element must be a widget - no exceptions.

## Goals

- Create widget wrappers for core DaisyUI components
- Establish patterns for grid-aligned widget sizing
- Implement widget-only composition (widgets contain only widgets)
- Provide clear patterns for developers to follow when creating new widgets
- Maintain simplicity and avoid complex validation that breaks builds

---

## 1. WIDGET IMPLEMENTATION STRATEGY

### 1.0 Tailwind CSS 4.0 Theme Requirements

**IMPORTANT**: Before implementing widgets, ensure all utility classes used are defined in your `@theme` block in `app.css`. The widgets below reference standard Tailwind utilities that must be defined:

```css
@theme {
  /* Text sizes */
  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  --font-size-2xl: 1.5rem;
  --font-size-3xl: 1.875rem;
  --font-size-4xl: 2.25rem;
  --font-size-5xl: 3rem;
  
  /* Font weights */
  --font-weight-thin: 100;
  --font-weight-light: 300;
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
  --font-weight-extrabold: 800;
}
```

Then define the corresponding CSS classes:

```css
/* Text size utilities */
.text-xs { font-size: var(--font-size-xs); }
.text-sm { font-size: var(--font-size-sm); }
.text-base { font-size: var(--font-size-base); }
.text-lg { font-size: var(--font-size-lg); }
.text-xl { font-size: var(--font-size-xl); }
.text-2xl { font-size: var(--font-size-2xl); }
.text-3xl { font-size: var(--font-size-3xl); }
.text-4xl { font-size: var(--font-size-4xl); }
.text-5xl { font-size: var(--font-size-5xl); }

/* Font weight utilities */
.font-thin { font-weight: var(--font-weight-thin); }
.font-light { font-weight: var(--font-weight-light); }
.font-normal { font-weight: var(--font-weight-normal); }
.font-medium { font-weight: var(--font-weight-medium); }
.font-semibold { font-weight: var(--font-weight-semibold); }
.font-bold { font-weight: var(--font-weight-bold); }
.font-extrabold { font-weight: var(--font-weight-extrabold); }

/* Flexbox utilities */
.flex { display: flex; }
.inline-flex { display: inline-flex; }
.flex-row { flex-direction: row; }
.flex-col { flex-direction: column; }
.flex-row-reverse { flex-direction: row-reverse; }
.flex-col-reverse { flex-direction: column-reverse; }
.items-start { align-items: flex-start; }
.items-center { align-items: center; }
.items-end { align-items: flex-end; }
.items-stretch { align-items: stretch; }
.items-baseline { align-items: baseline; }
.justify-start { justify-content: flex-start; }
.justify-center { justify-content: center; }
.justify-end { justify-content: flex-end; }
.justify-between { justify-content: space-between; }
.justify-around { justify-content: space-around; }
.justify-evenly { justify-content: space-evenly; }

/* Display utilities */
.block { display: block; }
.inline-block { display: inline-block; }
.grid { display: grid; }
.hidden { display: none; }

/* Text alignment */
.text-left { text-align: left; }
.text-center { text-align: center; }
.text-right { text-align: right; }
.text-justify { text-align: justify; }

/* Text colors */
.text-current { color: currentColor; }
.text-primary { color: var(--color-primary); }
.text-secondary { color: var(--color-secondary); }
.text-accent { color: var(--color-accent); }
.text-neutral { color: var(--color-neutral); }
.text-base-content { color: var(--color-base-content); }
.text-success { color: var(--color-success); }
.text-error { color: var(--color-error); }

/* Cursor */
.cursor-pointer { cursor: pointer; }

/* Padding utilities (already defined with LEGO units) */
.p-lego-1 { padding: var(--lego-unit); }
.p-lego-2 { padding: var(--lego-unit-2); }
.p-lego-4 { padding: var(--lego-unit-4); }
.p-lego-6 { padding: var(--lego-unit-6); }
.p-lego-8 { padding: var(--lego-unit-8); }

/* Gap utilities (already defined with LEGO units) */
.gap-lego-1 { gap: var(--lego-unit); }
.gap-lego-2 { gap: var(--lego-unit-2); }
.gap-lego-4 { gap: var(--lego-unit-4); }
.gap-lego-6 { gap: var(--lego-unit-6); }
.gap-lego-8 { gap: var(--lego-unit-8); }

/* Width utilities */
.w-full { width: 100%; }
.w-4 { width: 1rem; }
.h-4 { height: 1rem; }

/* Border utilities */
.border-t { border-top-width: 1px; }

/* Overflow utilities */
.overflow-x-auto { overflow-x: auto; }

/* Margin utilities */
.mt-auto { margin-top: auto; }
.mb-2 { margin-bottom: 0.5rem; }
.mb-4 { margin-bottom: 1rem; }
.mb-6 { margin-bottom: 1.5rem; }

/* Additional padding */
.pt-6 { padding-top: 1.5rem; }
.py-12 { padding-top: 3rem; padding-bottom: 3rem; }
.p-4 { padding: 1rem; }
```

### 1.1 Core Principles

Every widget must follow these principles:

1. **Grid Alignment**
   - Widget heights based on LEGO row units (64px base)
   - Widths fill their grid column by default
   - Padding/margins use LEGO units (4px base)

2. **Predictable Sizing**
   - Limited size options (xs, sm, md, lg, xl)
   - Sizes map to specific, predictable dimensions
   - No arbitrary or custom sizing

3. **Pure Composition**
   - Widgets can only contain other widgets
   - No raw HTML or text nodes
   - Clear parent-child relationships

4. **Simple Validation**
   - Use Phoenix.Component's built-in validation
   - Compile-time checks only
   - Clear, helpful error messages

### 1.2 Widget Naming Convention

DaisyUI Component → Widget Name:
- `btn` → `button_widget`
- `input` → `input_widget`
- `card` → `card_widget`
- `badge` → `badge_widget`
- etc.

### 1.3 Standard Widget Pattern

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.{Name} do
  @moduledoc """
  {Description of widget purpose and usage}
  """
  
  use Phoenix.Component
  
  # Define valid options as module attributes
  @valid_variants ~w(primary secondary accent neutral)
  @valid_sizes ~w(xs sm md lg xl)
  
  # Define attributes with validation
  attr :id, :any, default: nil
  attr :variant, :string, default: "primary", values: @valid_variants
  attr :size, :string, default: "md", values: @valid_sizes
  attr :class, :string, default: nil
  attr :rest, :global
  
  # Optional slots for composition
  slot :inner_block
  
  def {name}_widget(assigns) do
    ~H"""
    <!-- Widget implementation -->
    """
  end
  
  # Helper functions for class generation
  defp size_class("xs"), do: "btn-xs"
  defp size_class("sm"), do: "btn-sm"
  # etc.
end
```

---

## 2. FOUNDATION WIDGETS

These are the essential building blocks that replace HTML primitives.

### 2.1 Text Widget
**File:** `lib/demostarter_web/components/lego/widgets/text.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Text do
  @moduledoc """
  Text widget for displaying text content with consistent typography.
  Replaces direct text nodes, <p>, <span>, <div> with text.
  """
  
  use Phoenix.Component
  
  @valid_sizes ~w(xs sm base lg xl 2xl 3xl 4xl 5xl)
  @valid_weights ~w(thin light normal medium semibold bold extrabold)
  @valid_align ~w(left center right justify)
  @valid_colors ~w(inherit current primary secondary accent neutral base-content)
  
  attr :size, :string, default: "base", values: @valid_sizes
  attr :weight, :string, default: "normal", values: @valid_weights
  attr :align, :string, default: "left", values: @valid_align
  attr :color, :string, default: "inherit", values: @valid_colors
  attr :class, :string, default: nil
  
  slot :inner_block, required: true
  
  def text_widget(assigns) do
    ~H"""
    <span class={[
      text_size_class(@size),
      text_weight_class(@weight),
      text_align_class(@align),
      text_color_class(@color),
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </span>
    """
  end
  
  defp text_size_class("xs"), do: "text-xs"
  defp text_size_class("sm"), do: "text-sm"
  defp text_size_class("base"), do: "text-base"
  defp text_size_class("lg"), do: "text-lg"
  defp text_size_class("xl"), do: "text-xl"
  defp text_size_class("2xl"), do: "text-2xl"
  defp text_size_class("3xl"), do: "text-3xl"
  defp text_size_class("4xl"), do: "text-4xl"
  defp text_size_class("5xl"), do: "text-5xl"
  
  defp text_weight_class("thin"), do: "font-thin"
  defp text_weight_class("light"), do: "font-light"
  defp text_weight_class("normal"), do: "font-normal"
  defp text_weight_class("medium"), do: "font-medium"
  defp text_weight_class("semibold"), do: "font-semibold"
  defp text_weight_class("bold"), do: "font-bold"
  defp text_weight_class("extrabold"), do: "font-extrabold"
  
  defp text_align_class("left"), do: "text-left"
  defp text_align_class("center"), do: "text-center"
  defp text_align_class("right"), do: "text-right"
  defp text_align_class("justify"), do: "text-justify"
  
  defp text_color_class("inherit"), do: ""
  defp text_color_class("current"), do: "text-current"
  defp text_color_class("primary"), do: "text-primary"
  defp text_color_class("secondary"), do: "text-secondary"
  defp text_color_class("accent"), do: "text-accent"
  defp text_color_class("neutral"), do: "text-neutral"
  defp text_color_class("base-content"), do: "text-base-content"
end
```

### 2.2 Container Widget
**File:** `lib/demostarter_web/components/lego/widgets/container.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Container do
  @moduledoc """
  Generic container widget for layout and grouping other widgets.
  Replaces <div> elements.
  """
  
  use Phoenix.Component
  
  @valid_display ~w(block inline-block flex inline-flex grid hidden)
  @valid_direction ~w(row col row-reverse col-reverse)
  @valid_align ~w(start center end stretch baseline)
  @valid_justify ~w(start center end between around evenly)
  @valid_gap ~w(0 1 2 4 6 8)
  @valid_padding ~w(0 1 2 4 6 8)
  
  attr :display, :string, default: "block", values: @valid_display
  attr :direction, :string, default: "row", values: @valid_direction
  attr :align, :string, default: "stretch", values: @valid_align
  attr :justify, :string, default: "start", values: @valid_justify
  attr :gap, :string, default: "0", values: @valid_gap
  attr :padding, :string, default: "0", values: @valid_padding
  attr :class, :string, default: nil
  attr :rest, :global
  
  slot :inner_block, required: true
  
  def container_widget(assigns) do
    ~H"""
    <div
      class={[
        display_class(@display),
        @display in ["flex", "inline-flex"] && direction_class(@direction),
        @display in ["flex", "inline-flex"] && align_class(@align),
        @display in ["flex", "inline-flex"] && justify_class(@justify),
        gap_class(@gap),
        padding_class(@padding),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
  
  defp display_class("block"), do: "block"
  defp display_class("inline-block"), do: "inline-block"
  defp display_class("flex"), do: "flex"
  defp display_class("inline-flex"), do: "inline-flex"
  defp display_class("grid"), do: "grid"
  defp display_class("hidden"), do: "hidden"
  
  defp direction_class("row"), do: "flex-row"
  defp direction_class("col"), do: "flex-col"
  defp direction_class("row-reverse"), do: "flex-row-reverse"
  defp direction_class("col-reverse"), do: "flex-col-reverse"
  
  defp align_class("start"), do: "items-start"
  defp align_class("center"), do: "items-center"
  defp align_class("end"), do: "items-end"
  defp align_class("stretch"), do: "items-stretch"
  defp align_class("baseline"), do: "items-baseline"
  
  defp justify_class("start"), do: "justify-start"
  defp justify_class("center"), do: "justify-center"
  defp justify_class("end"), do: "justify-end"
  defp justify_class("between"), do: "justify-between"
  defp justify_class("around"), do: "justify-around"
  defp justify_class("evenly"), do: "justify-evenly"
  
  defp gap_class("0"), do: ""
  defp gap_class("1"), do: "gap-lego-1"
  defp gap_class("2"), do: "gap-lego-2"
  defp gap_class("4"), do: "gap-lego-4"
  defp gap_class("6"), do: "gap-lego-6"
  defp gap_class("8"), do: "gap-lego-8"
  
  defp padding_class("0"), do: ""
  defp padding_class("1"), do: "p-lego-1"
  defp padding_class("2"), do: "p-lego-2"
  defp padding_class("4"), do: "p-lego-4"
  defp padding_class("6"), do: "p-lego-6"
  defp padding_class("8"), do: "p-lego-8"
end
```

### 2.3 Button Widget
**File:** `lib/demostarter_web/components/lego/widgets/button.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Button do
  @moduledoc """
  Button widget wrapping DaisyUI button component.
  Provides consistent sizing that aligns with the grid system.
  """
  
  use Phoenix.Component
  
  @valid_variants ~w(primary secondary accent neutral ghost link)
  @valid_sizes ~w(xs sm md lg)
  @valid_width ~w(auto full)
  @valid_types ~w(button submit reset)
  
  attr :label, :string, required: true
  attr :variant, :string, default: "primary", values: @valid_variants
  attr :size, :string, default: "md", values: @valid_sizes
  attr :width, :string, default: "auto", values: @valid_width
  attr :type, :string, default: "button", values: @valid_types
  attr :disabled, :boolean, default: false
  attr :loading, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(phx-click phx-target phx-value-id)
  
  def button_widget(assigns) do
    ~H"""
    <button
      type={@type}
      disabled={@disabled || @loading}
      class={[
        "btn",
        variant_class(@variant),
        size_class(@size),
        @width == "full" && "w-full",
        @loading && "loading",
        @class
      ]}
      {@rest}
    >
      <%= @label %>
    </button>
    """
  end
  
  defp variant_class("primary"), do: "btn-primary"
  defp variant_class("secondary"), do: "btn-secondary"
  defp variant_class("accent"), do: "btn-accent"
  defp variant_class("neutral"), do: "btn-neutral"
  defp variant_class("ghost"), do: "btn-ghost"
  defp variant_class("link"), do: "btn-link"
  
  defp size_class("xs"), do: "btn-xs"
  defp size_class("sm"), do: "btn-sm"
  defp size_class("md"), do: ""
  defp size_class("lg"), do: "btn-lg"
end
```

---

## 3. FORM INPUT WIDGETS

Essential widgets for user input that maintain consistent heights for grid alignment.

### 3.1 Input Widget
**File:** `lib/demostarter_web/components/lego/widgets/input.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Input do
  @moduledoc """
  Text input widget wrapping DaisyUI input component.
  Maintains consistent height for grid alignment.
  """
  
  use Phoenix.Component
  
  @valid_types ~w(text email password number tel url search date time datetime-local)
  @valid_sizes ~w(xs sm md lg)
  @valid_variants ~w(bordered ghost primary secondary accent)
  
  attr :name, :string, required: true
  attr :label, :string, required: true
  attr :type, :string, default: "text", values: @valid_types
  attr :value, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :required, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :size, :string, default: "md", values: @valid_sizes
  attr :variant, :string, default: "bordered", values: @valid_variants
  attr :error, :string, default: nil
  attr :hint, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  
  def input_widget(assigns) do
    ~H"""
    <div class="form-control w-full">
      <label class="label" for={@name}>
        <span class="label-text"><%= @label %></span>
        <span :if={@required} class="label-text-alt text-error">*</span>
      </label>
      <input
        id={@name}
        name={@name}
        type={@type}
        value={@value}
        placeholder={@placeholder}
        required={@required}
        disabled={@disabled}
        class={[
          "input w-full",
          variant_class(@variant),
          size_class(@size),
          @error && "input-error",
          @class
        ]}
        {@rest}
      />
      <label :if={@error || @hint} class="label">
        <span :if={@error} class="label-text-alt text-error"><%= @error %></span>
        <span :if={@hint && !@error} class="label-text-alt"><%= @hint %></span>
      </label>
    </div>
    """
  end
  
  defp variant_class("bordered"), do: "input-bordered"
  defp variant_class("ghost"), do: "input-ghost"
  defp variant_class("primary"), do: "input-primary"
  defp variant_class("secondary"), do: "input-secondary"
  defp variant_class("accent"), do: "input-accent"
  
  defp size_class("xs"), do: "input-xs"
  defp size_class("sm"), do: "input-sm"
  defp size_class("md"), do: "input-md"
  defp size_class("lg"), do: "input-lg"
end
```

### 3.2 Select Widget
**File:** `lib/demostarter_web/components/lego/widgets/select.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Select do
  @moduledoc """
  Dropdown select widget wrapping DaisyUI select component.
  """
  
  use Phoenix.Component
  
  @valid_sizes ~w(xs sm md lg)
  @valid_variants ~w(bordered ghost primary secondary accent)
  
  attr :name, :string, required: true
  attr :label, :string, required: true
  attr :options, :list, required: true, doc: "List of {label, value} tuples"
  attr :value, :string, default: nil
  attr :prompt, :string, default: "Choose an option"
  attr :required, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :size, :string, default: "md", values: @valid_sizes
  attr :variant, :string, default: "bordered", values: @valid_variants
  attr :error, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  
  def select_widget(assigns) do
    ~H"""
    <div class="form-control w-full">
      <label class="label" for={@name}>
        <span class="label-text"><%= @label %></span>
        <span :if={@required} class="label-text-alt text-error">*</span>
      </label>
      <select
        id={@name}
        name={@name}
        required={@required}
        disabled={@disabled}
        class={[
          "select w-full",
          variant_class(@variant),
          size_class(@size),
          @error && "select-error",
          @class
        ]}
        {@rest}
      >
        <option value="" disabled selected={!@value}><%= @prompt %></option>
        <option :for={{label, value} <- @options} value={value} selected={@value == value}>
          <%= label %>
        </option>
      </select>
      <label :if={@error} class="label">
        <span class="label-text-alt text-error"><%= @error %></span>
      </label>
    </div>
    """
  end
  
  defp variant_class("bordered"), do: "select-bordered"
  defp variant_class("ghost"), do: "select-ghost"
  defp variant_class("primary"), do: "select-primary"
  defp variant_class("secondary"), do: "select-secondary"
  defp variant_class("accent"), do: "select-accent"
  
  defp size_class("xs"), do: "select-xs"
  defp size_class("sm"), do: "select-sm"
  defp size_class("md"), do: "select-md"
  defp size_class("lg"), do: "select-lg"
end
```

### 3.3 Checkbox Widget
**File:** `lib/demostarter_web/components/lego/widgets/checkbox.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Checkbox do
  @moduledoc """
  Checkbox widget with integrated label.
  """
  
  use Phoenix.Component
  
  @valid_sizes ~w(xs sm md lg)
  @valid_variants ~w(primary secondary accent success warning error)
  
  attr :name, :string, required: true
  attr :label, :string, required: true
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :size, :string, default: "md", values: @valid_sizes
  attr :variant, :string, default: nil, values: @valid_variants
  attr :class, :string, default: nil
  attr :rest, :global
  
  def checkbox_widget(assigns) do
    ~H"""
    <div class="form-control">
      <label class="label cursor-pointer justify-start gap-4">
        <input
          type="checkbox"
          name={@name}
          checked={@checked}
          disabled={@disabled}
          class={[
            "checkbox",
            variant_class(@variant),
            size_class(@size),
            @class
          ]}
          {@rest}
        />
        <span class="label-text"><%= @label %></span>
      </label>
    </div>
    """
  end
  
  defp variant_class(nil), do: ""
  defp variant_class("primary"), do: "checkbox-primary"
  defp variant_class("secondary"), do: "checkbox-secondary"
  defp variant_class("accent"), do: "checkbox-accent"
  defp variant_class("success"), do: "checkbox-success"
  defp variant_class("warning"), do: "checkbox-warning"
  defp variant_class("error"), do: "checkbox-error"
  
  defp size_class("xs"), do: "checkbox-xs"
  defp size_class("sm"), do: "checkbox-sm"
  defp size_class("md"), do: "checkbox-md"
  defp size_class("lg"), do: "checkbox-lg"
end
```

### 3.4 Radio Widget
**File:** `lib/demostarter_web/components/lego/widgets/radio.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Radio do
  @moduledoc """
  Radio button widget with integrated label.
  """
  
  use Phoenix.Component
  
  @valid_sizes ~w(xs sm md lg)
  @valid_variants ~w(primary secondary accent success warning error)
  
  attr :name, :string, required: true
  attr :label, :string, required: true
  attr :value, :string, required: true
  attr :checked, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :size, :string, default: "md", values: @valid_sizes
  attr :variant, :string, default: nil, values: @valid_variants
  attr :class, :string, default: nil
  attr :rest, :global
  
  def radio_widget(assigns) do
    ~H"""
    <div class="form-control">
      <label class="label cursor-pointer justify-start gap-4">
        <input
          type="radio"
          name={@name}
          value={@value}
          checked={@checked}
          disabled={@disabled}
          class={[
            "radio",
            variant_class(@variant),
            size_class(@size),
            @class
          ]}
          {@rest}
        />
        <span class="label-text"><%= @label %></span>
      </label>
    </div>
    """
  end
  
  defp variant_class(nil), do: ""
  defp variant_class("primary"), do: "radio-primary"
  defp variant_class("secondary"), do: "radio-secondary"
  defp variant_class("accent"), do: "radio-accent"
  defp variant_class("success"), do: "radio-success"
  defp variant_class("warning"), do: "radio-warning"
  defp variant_class("error"), do: "radio-error"
  
  defp size_class("xs"), do: "radio-xs"
  defp size_class("sm"), do: "radio-sm"
  defp size_class("md"), do: "radio-md"
  defp size_class("lg"), do: "radio-lg"
end
```

---

## 4. LAYOUT WIDGETS

Widgets for organizing and structuring content.

### 4.1 Card Widget
**File:** `lib/demostarter_web/components/lego/widgets/card.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Card do
  @moduledoc """
  Card widget for content containers.
  Inherits grid sizing from parent container.
  """
  
  use Phoenix.Component
  
  @valid_padding ~w(none compact normal spacious)
  @valid_shadow ~w(none sm base md lg xl)
  
  attr :title, :string, default: nil
  attr :padding, :string, default: "normal", values: @valid_padding
  attr :shadow, :string, default: "base", values: @valid_shadow
  attr :class, :string, default: nil
  
  slot :inner_block, required: true
  slot :actions
  slot :footer
  
  def card_widget(assigns) do
    ~H"""
    <div class={[
      "card bg-base-100",
      shadow_class(@shadow),
      @class
    ]}>
      <div :if={@title || @actions != []} class="card-header flex justify-between items-center p-4 border-b">
        <h3 :if={@title} class="card-title"><%= @title %></h3>
        <div :if={@actions != []} class="card-actions">
          <%= render_slot(@actions) %>
        </div>
      </div>
      
      <div class={["card-body", padding_class(@padding)]}>
        <%= render_slot(@inner_block) %>
      </div>
      
      <div :if={@footer != []} class="card-footer p-4 border-t bg-base-200">
        <%= render_slot(@footer) %>
      </div>
    </div>
    """
  end
  
  defp padding_class("none"), do: "p-0"
  defp padding_class("compact"), do: "p-4"
  defp padding_class("normal"), do: "p-6"
  defp padding_class("spacious"), do: "p-8"
  
  defp shadow_class("none"), do: ""
  defp shadow_class("sm"), do: "shadow-sm"
  defp shadow_class("base"), do: "shadow"
  defp shadow_class("md"), do: "shadow-md"
  defp shadow_class("lg"), do: "shadow-lg"
  defp shadow_class("xl"), do: "shadow-xl"
end
```

### 4.2 Divider Widget
**File:** `lib/demostarter_web/components/lego/widgets/divider.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Divider do
  @moduledoc """
  Visual divider widget for separating content.
  """
  
  use Phoenix.Component
  
  @valid_orientation ~w(horizontal vertical)
  @valid_spacing ~w(xs sm md lg xl)
  
  attr :orientation, :string, default: "horizontal", values: @valid_orientation
  attr :spacing, :string, default: "md", values: @valid_spacing
  attr :text, :string, default: nil
  attr :class, :string, default: nil
  
  def divider_widget(assigns) do
    ~H"""
    <div class={[
      "divider",
      spacing_class(@spacing),
      @orientation == "vertical" && "divider-vertical",
      @class
    ]}>
      <%= @text %>
    </div>
    """
  end
  
  defp spacing_class("xs"), do: "my-2"
  defp spacing_class("sm"), do: "my-4"
  defp spacing_class("md"), do: "my-6"
  defp spacing_class("lg"), do: "my-8"
  defp spacing_class("xl"), do: "my-12"
end
```

---

## 5. DATA DISPLAY WIDGETS

Widgets for presenting information to users.

### 5.1 Badge Widget
**File:** `lib/demostarter_web/components/lego/widgets/badge.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Badge do
  @moduledoc """
  Badge widget for status indicators and labels.
  """
  
  use Phoenix.Component
  
  @valid_variants ~w(primary secondary accent neutral success warning error info)
  @valid_sizes ~w(xs sm md lg)
  @valid_style ~w(solid outline ghost)
  
  attr :text, :string, required: true
  attr :variant, :string, default: "neutral", values: @valid_variants
  attr :size, :string, default: "md", values: @valid_sizes
  attr :style, :string, default: "solid", values: @valid_style
  attr :class, :string, default: nil
  
  def badge_widget(assigns) do
    ~H"""
    <span class={[
      "badge",
      variant_class(@variant),
      size_class(@size),
      style_class(@style),
      @class
    ]}>
      <%= @text %>
    </span>
    """
  end
  
  defp variant_class("primary"), do: "badge-primary"
  defp variant_class("secondary"), do: "badge-secondary"
  defp variant_class("accent"), do: "badge-accent"
  defp variant_class("neutral"), do: "badge-neutral"
  defp variant_class("success"), do: "badge-success"
  defp variant_class("warning"), do: "badge-warning"
  defp variant_class("error"), do: "badge-error"
  defp variant_class("info"), do: "badge-info"
  
  defp size_class("xs"), do: "badge-xs"
  defp size_class("sm"), do: "badge-sm"
  defp size_class("md"), do: "badge-md"
  defp size_class("lg"), do: "badge-lg"
  
  defp style_class("solid"), do: ""
  defp style_class("outline"), do: "badge-outline"
  defp style_class("ghost"), do: "badge-ghost"
end
```

### 5.2 Table Widget
**File:** `lib/demostarter_web/components/lego/widgets/table.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.Table do
  @moduledoc """
  Table widget for displaying tabular data.
  Uses slots for maximum flexibility while maintaining widget-only composition.
  """
  
  use Phoenix.Component
  
  @valid_sizes ~w(xs sm md lg)
  @valid_styles ~w(normal zebra)
  
  attr :size, :string, default: "md", values: @valid_sizes
  attr :style, :string, default: "normal", values: @valid_styles
  attr :class, :string, default: nil
  
  slot :header, required: true
  slot :row, required: true
  
  def table_widget(assigns) do
    ~H"""
    <div class="overflow-x-auto w-full">
      <table class={[
        "table w-full",
        size_class(@size),
        @style == "zebra" && "table-zebra",
        @class
      ]}>
        <thead>
          <%= render_slot(@header) %>
        </thead>
        <tbody>
          <%= for row <- @row do %>
            <%= render_slot(row) %>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
  
  defp size_class("xs"), do: "table-xs"
  defp size_class("sm"), do: "table-sm"
  defp size_class("md"), do: ""
  defp size_class("lg"), do: "table-lg"
end
```

---

## 6. INTEGRATING WIDGETS INTO CORE COMPONENTS

Update the main CoreComponents module to import all widgets:

**File:** `lib/demostarter_web/components/core_components.ex`

Add to the existing imports:

```elixir
defmodule DemostarterWeb.CoreComponents do
  use Phoenix.Component
  
  # Import LEGO layout components (from Phase 1)
  import DemostarterWeb.Components.Lego.BaseWidget
  import DemostarterWeb.Components.Lego.Containers
  import DemostarterWeb.Components.Lego.Layouts
  
  # Import all Phase 2 widgets
  import DemostarterWeb.Components.Lego.Widgets.Text
  import DemostarterWeb.Components.Lego.Widgets.Container
  import DemostarterWeb.Components.Lego.Widgets.Button
  import DemostarterWeb.Components.Lego.Widgets.Input
  import DemostarterWeb.Components.Lego.Widgets.Select
  import DemostarterWeb.Components.Lego.Widgets.Checkbox
  import DemostarterWeb.Components.Lego.Widgets.Radio
  import DemostarterWeb.Components.Lego.Widgets.Card
  import DemostarterWeb.Components.Lego.Widgets.Divider
  import DemostarterWeb.Components.Lego.Widgets.Badge
  import DemostarterWeb.Components.Lego.Widgets.Table
  
  # ... rest of the module
end
```

---

## 7. MIGRATION FROM PHASE 1

### 7.1 Update Demo LiveView

Transform the Phase 1 demo to use only widgets:

**Before (Phase 1):**
```heex
<.lego_widget size="2x1" title="Revenue">
  <div class="text-2xl font-bold">$42,000</div>
</.lego_widget>
```

**After (Phase 2):**
```heex
<.card_widget>
  <.text_widget size="2xl" weight="bold">$42,000</.text_widget>
</.card_widget>
```

### 7.2 Complete Example

Here's a complete example showing widget-only composition:

```heex
<.lego_container>
  <.card_widget title="User Profile">
    <.container_widget display="flex" direction="col" gap="4">
      <.container_widget display="flex" align="center" gap="4">
        <.badge_widget text="Active" variant="success" />
        <.text_widget size="sm" color="neutral">Last login: 2 hours ago</.text_widget>
      </.container_widget>
      
      <.divider_widget />
      
      <.container_widget display="flex" direction="col" gap="2">
        <.text_widget weight="semibold">John Doe</.text_widget>
        <.text_widget size="sm" color="neutral">john.doe@example.com</.text_widget>
      </.container_widget>
      
      <.container_widget display="flex" gap="2">
        <.button_widget label="Edit Profile" variant="primary" size="sm" />
        <.button_widget label="Settings" variant="ghost" size="sm" />
      </.container_widget>
    </.container_widget>
  </.card_widget>
</.lego_container>
```

---

## 8. DEVELOPER GUIDELINES

### 8.1 Creating New Widgets

When creating a new widget, follow these steps:

1. **Identify the DaisyUI component** you're wrapping
2. **Define constrained attributes** - limit options to what makes sense
3. **Use grid-friendly sizing** - ensure it aligns with the LEGO grid
4. **Test composition** - verify it works well with other widgets
5. **Document usage** - provide clear examples

### 8.2 Widget Composition Rules

1. **Widgets contain only widgets** - no raw HTML or text
2. **Use text_widget for all text** - even single words
3. **Use container_widget for layout** - replaces all divs
4. **Maintain consistent spacing** - use LEGO units only

### 8.3 Common Patterns

**Form Group:**
```heex
<.container_widget display="flex" direction="col" gap="4">
  <.input_widget name="email" label="Email" type="email" />
  <.input_widget name="password" label="Password" type="password" />
  <.button_widget label="Sign In" variant="primary" width="full" />
</.container_widget>
```

**Data Row:**
```heex
<.container_widget display="flex" justify="between" align="center" padding="4">
  <.text_widget weight="medium">User Name</.text_widget>
  <.badge_widget text="Active" variant="success" />
</.container_widget>
```

---

## 9. TESTING APPROACH

### 9.1 Widget Test Template

```elixir
defmodule DemostarterWeb.Components.Lego.Widgets.ButtonTest do
  use DemostarterWeb.ComponentCase
  
  import DemostarterWeb.Components.Lego.Widgets.Button
  
  test "renders button with default attributes" do
    html = render_component(&button_widget/1, label: "Click me")
    assert html =~ "Click me"
    assert html =~ "btn"
    assert html =~ "btn-primary"
  end
  
  test "validates variant attribute" do
    assert_raise ArgumentError, ~r/invalid value for attribute/, fn ->
      render_component(&button_widget/1, label: "Test", variant: "invalid")
    end
  end
end
```

### 9.2 Test Categories

1. **Attribute validation** - Ensure invalid values are rejected
2. **Rendering** - Verify correct HTML output
3. **Composition** - Test widgets containing other widgets
4. **Grid alignment** - Verify sizing works with grid system

---

## 10. VERIFICATION CHECKLIST

Before completing Phase 2, ensure:

- [ ] **Foundation Widgets Complete**
  - [ ] text_widget replaces all text nodes
  - [ ] container_widget replaces all divs
  - [ ] button_widget handles all button needs

- [ ] **Form Widgets Complete**
  - [ ] All input types covered
  - [ ] Consistent height alignment
  - [ ] Error states handled

- [ ] **Layout Widgets Complete**
  - [ ] card_widget for content grouping
  - [ ] divider_widget for visual separation

- [ ] **Validation Working**
  - [ ] No HTML allowed in templates
  - [ ] No CSS classes in templates
  - [ ] Only widgets can contain widgets

- [ ] **Documentation**
  - [ ] Each widget has usage examples
  - [ ] Migration guide updated
  - [ ] Common patterns documented

- [ ] **Testing**
  - [ ] Each widget has basic tests
  - [ ] Composition tested
  - [ ] Invalid attributes rejected

- [ ] **Demo Updated**
  - [ ] All examples use only widgets
  - [ ] No raw HTML anywhere
  - [ ] Shows real-world patterns

---

## 11. COMMON ISSUES AND SOLUTIONS

### Issue: Text without widget wrapper
**Error:** "Raw text content not allowed in templates"
**Solution:** Wrap all text in `<.text_widget>`

### Issue: Direct HTML element usage
**Error:** "HTML elements not allowed. Use widget components"
**Solution:** Replace HTML with appropriate widget

### Issue: CSS classes in template
**Error:** "CSS classes not allowed in templates"
**Solution:** Use widget attributes instead of classes

### Issue: Widget size doesn't align with grid
**Problem:** Widget breaks grid layout
**Solution:** Ensure widget respects parent container sizing

---

## 12. NEXT STEPS

After Phase 2 is complete:

1. **Phase 3**: Advanced layout patterns and complex widgets
2. **Phase 4**: Enhanced validation and tooling
3. **Phase 5**: Interactive features and LiveView integration
4. **Phase 6**: Complete documentation and component library

---

This completes the Phase 2 implementation plan for core widget components in the LEGO UI system.