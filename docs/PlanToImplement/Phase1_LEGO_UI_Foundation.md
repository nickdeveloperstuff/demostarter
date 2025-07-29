# PHASE 1: LEGO-STYLE UI FOUNDATION - DETAILED IMPLEMENTATION PLAN

## Overview
This document provides a comprehensive, step-by-step implementation plan for Phase 1 of the LEGO-style constrained UI system for the Demostarter Phoenix LiveView application. This is a greenfield approach that will establish a robust foundation for an "idiot-proof" component system where **every UI element must be a widget** - no direct HTML or DaisyUI usage is allowed in templates.

## Goals
- Establish a 12-column CSS Grid foundation with mathematical consistency
- Create compile-time validated widget components that enforce widget-only composition
- Centralize all styling in app.css (only for internal widget use)
- Implement container queries for micro-responsiveness
- Set up validation infrastructure to prevent ANY non-widget usage in templates
- Ensure ALL UI elements are widgets - no direct HTML, CSS classes, or DaisyUI components in templates

---

## 1. CSS GRID FOUNDATION SETUP

### 1.1 Central App.CSS Transformation
**File:** `assets/css/app.css`

**IMPORTANT: The CSS defined here is ONLY for internal use by widget implementations. Developers will never write CSS classes in their templates - they will only use widget components.**

#### 1.1.1 Clean Slate Approach
First, we'll strip the existing CSS to its core Tailwind imports using Tailwind CSS 4.0 syntax:

```css
/* Tailwind CSS 4.0 imports */
@import "tailwindcss" source(none);
@source "../../deps/ash_authentication_phoenix";
@source "../css";
@source "../js";
@source "../../lib/demostarter_web";

/* DaisyUI plugin */
@plugin "../vendor/daisyui" {
  themes: false;
}
```

#### 1.1.2 Define LEGO Grid System Variables
Add comprehensive CSS custom properties for the grid system using Tailwind CSS 4.0's @theme block. **IMPORTANT: These CSS classes will ONLY be used internally by widget implementations. Developers will never use these classes directly in templates.**

```css
/* Define theme variables in Tailwind CSS 4.0 */
@theme {
  /* LEGO Unit System - 4px base unit for mathematical consistency */
  --lego-unit: 4px;
  --lego-unit-2: calc(var(--lego-unit) * 2);   /* 8px */
  --lego-unit-3: calc(var(--lego-unit) * 3);   /* 12px */
  --lego-unit-4: calc(var(--lego-unit) * 4);   /* 16px */
  --lego-unit-6: calc(var(--lego-unit) * 6);   /* 24px */
  --lego-unit-8: calc(var(--lego-unit) * 8);   /* 32px */
  --lego-unit-12: calc(var(--lego-unit) * 12); /* 48px */
  --lego-unit-16: calc(var(--lego-unit) * 16); /* 64px */
  
  /* Grid Configuration */
  --lego-cols: 12;
  --lego-gap: var(--lego-unit-4);              /* 16px standard gap */
  --lego-container-max: 1200px;
  --lego-container-padding: var(--lego-unit-6);
  
  /* Widget Heights (based on rows) */
  --lego-row-height: var(--lego-unit-16);      /* 64px base row height */
  --lego-row-gap: var(--lego-gap);
  
  /* Z-index layers */
  --lego-z-base: 0;
  --lego-z-widget: 10;
  --lego-z-overlay: 20;
  --lego-z-modal: 30;
  --lego-z-toast: 40;
  
  /* Transitions */
  --lego-transition-fast: 150ms ease-in-out;
  --lego-transition-base: 250ms ease-in-out;
  --lego-transition-slow: 350ms ease-in-out;
  
  /* Shadows */
  --lego-shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --lego-shadow-base: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
  --lego-shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
  --lego-shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
  
  /* Spacing values for Tailwind utilities */
  --spacing-lego-1: var(--lego-unit);
  --spacing-lego-2: var(--lego-unit-2);
  --spacing-lego-3: var(--lego-unit-3);
  --spacing-lego-4: var(--lego-unit-4);
  --spacing-lego-6: var(--lego-unit-6);
  --spacing-lego-8: var(--lego-unit-8);
  --spacing-lego-12: var(--lego-unit-12);
  --spacing-lego-16: var(--lego-unit-16);
}
```

#### 1.1.3 LEGO Container Classes
Define the core container and widget classes. Note that in Tailwind CSS 4.0, we define these classes directly without @layer:

```css
/* LEGO Container and Widget Classes */
/* Main container for the grid system */
.lego-container {
  display: grid;
  grid-template-columns: repeat(var(--lego-cols), 1fr);
  gap: var(--lego-gap);
  max-width: var(--lego-container-max);
  margin: 0 auto;
  padding: var(--lego-container-padding);
  container-type: inline-size;
}

/* Base widget styling */
.lego-widget {
  container-type: inline-size;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  background: var(--color-base-100);
  border-radius: var(--lego-unit-2);
  box-shadow: var(--lego-shadow-base);
  transition: box-shadow var(--lego-transition-fast);
  position: relative;
  z-index: var(--lego-z-widget);
}

.lego-widget:hover {
  box-shadow: var(--lego-shadow-md);
}

/* Widget header */
.lego-widget-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--lego-unit-4);
  border-bottom: 1px solid var(--color-base-200);
}

.lego-widget-title {
  font-size: 1rem;
  font-weight: 600;
  color: var(--color-base-content);
  margin: 0;
}

.lego-widget-actions {
  display: flex;
  gap: var(--lego-unit-2);
}

/* Widget content area */
.lego-widget-content {
  flex: 1;
  padding: var(--lego-unit-4);
  overflow: auto;
}

/* Widget footer */
.lego-widget-footer {
  padding: var(--lego-unit-3) var(--lego-unit-4);
  border-top: 1px solid var(--color-base-200);
  background: var(--color-base-50);
}
```

#### 1.1.4 Widget Size Classes (Grid-based)
Define all allowed widget sizes without using @apply (which is discouraged in Tailwind CSS 4.0):

```css
/* Widget Size Utilities */
/* Column span utilities */
.lego-cols-1 { grid-column: span 1; }
.lego-cols-2 { grid-column: span 2; }
.lego-cols-3 { grid-column: span 3; }
.lego-cols-4 { grid-column: span 4; }
.lego-cols-6 { grid-column: span 6; }
.lego-cols-12 { grid-column: span 12; }

/* Row span utilities with minimum heights */
.lego-rows-1 { 
  grid-row: span 1; 
  min-height: var(--lego-row-height);
}
.lego-rows-2 { 
  grid-row: span 2; 
  min-height: calc(var(--lego-row-height) * 2 + var(--lego-row-gap));
}
.lego-rows-3 { 
  grid-row: span 3; 
  min-height: calc(var(--lego-row-height) * 3 + var(--lego-row-gap) * 2);
}

/* Combined size classes - the only allowed widget sizes */
.lego-1x1 { 
  grid-column: span 1;
  grid-row: span 1;
  min-height: var(--lego-row-height);
}
.lego-2x1 { 
  grid-column: span 2;
  grid-row: span 1;
  min-height: var(--lego-row-height);
}
.lego-2x2 { 
  grid-column: span 2;
  grid-row: span 2;
  min-height: calc(var(--lego-row-height) * 2 + var(--lego-row-gap));
}
.lego-3x1 { 
  grid-column: span 3;
  grid-row: span 1;
  min-height: var(--lego-row-height);
}
.lego-3x2 { 
  grid-column: span 3;
  grid-row: span 2;
  min-height: calc(var(--lego-row-height) * 2 + var(--lego-row-gap));
}
.lego-4x1 { 
  grid-column: span 4;
  grid-row: span 1;
  min-height: var(--lego-row-height);
}
.lego-4x2 { 
  grid-column: span 4;
  grid-row: span 2;
  min-height: calc(var(--lego-row-height) * 2 + var(--lego-row-gap));
}
.lego-6x1 { 
  grid-column: span 6;
  grid-row: span 1;
  min-height: var(--lego-row-height);
}
.lego-6x2 { 
  grid-column: span 6;
  grid-row: span 2;
  min-height: calc(var(--lego-row-height) * 2 + var(--lego-row-gap));
}
.lego-12x1 { 
  grid-column: span 12;
  grid-row: span 1;
  min-height: var(--lego-row-height);
}
.lego-12x2 { 
  grid-column: span 12;
  grid-row: span 2;
  min-height: calc(var(--lego-row-height) * 2 + var(--lego-row-gap));
}
```

#### 1.1.5 Container Query Responsive System
Implement widget-level and system-level responsive behavior:

```css
/* Container Query Responsive System */
/* Widget-level responsive adjustments using container queries */
@container (max-width: 200px) {
  .lego-widget {
    --lego-padding: var(--lego-unit-2);
  }
  .lego-widget-title {
    font-size: 0.75rem;
  }
  .lego-widget-content {
    padding: var(--lego-padding);
  }
}

@container (min-width: 300px) and (max-width: 400px) {
  .lego-widget {
    --lego-padding: var(--lego-unit-3);
  }
  .lego-widget-title {
    font-size: 0.875rem;
  }
}

@container (min-width: 400px) {
  .lego-widget {
    --lego-padding: var(--lego-unit-4);
  }
  .lego-widget-title {
    font-size: 1rem;
  }
}

/* System-level responsive grid collapse */
@media (max-width: 768px) {
  .lego-container {
    grid-template-columns: 1fr;
    padding: var(--lego-unit-4);
  }
  
  /* Force all widgets to full width on mobile */
  .lego-widget {
    grid-column: span 1 !important;
  }
  
  /* Adjust row heights for mobile */
  .lego-rows-2,
  .lego-rows-3 {
    min-height: auto;
  }
}

@media (min-width: 768px) and (max-width: 1024px) {
  .lego-container {
    grid-template-columns: repeat(6, 1fr);
  }
  
  /* Adjust widget spans for tablet */
  .lego-cols-12 { grid-column: span 6; }
  .lego-cols-6 { grid-column: span 6; }
  .lego-cols-4 { grid-column: span 3; }
}
```

#### 1.1.6 Additional Layout Utilities
Add supporting layout classes:

```css
/* Additional Layout Utilities */
/* Section styling */
.lego-section {
  margin-bottom: var(--lego-unit-8);
}

.lego-section-title {
  font-size: 1.5rem;
  font-weight: 700;
  margin-bottom: var(--lego-unit-4);
  color: var(--color-base-content);
}

/* Main content area */
.lego-main {
  min-height: 100vh;
  background: var(--color-base-50);
  padding-top: var(--lego-unit-6);
  padding-bottom: var(--lego-unit-12);
}

/* Spacing utilities using LEGO units */
.lego-space-1 { margin: var(--lego-unit); }
.lego-space-2 { margin: var(--lego-unit-2); }
.lego-space-4 { margin: var(--lego-unit-4); }
.lego-space-6 { margin: var(--lego-unit-6); }
.lego-space-8 { margin: var(--lego-unit-8); }

/* Padding utilities */
.lego-pad-1 { padding: var(--lego-unit); }
.lego-pad-2 { padding: var(--lego-unit-2); }
.lego-pad-4 { padding: var(--lego-unit-4); }
.lego-pad-6 { padding: var(--lego-unit-6); }
.lego-pad-8 { padding: var(--lego-unit-8); }
```

---

## 2. TAILWIND CSS 4.0 CONFIGURATION

### 2.1 Tailwind CSS 4.0 Setup
Since Tailwind CSS 4.0 doesn't use a configuration file, all customization is done in the CSS file using the `@theme` block and `@plugin` directives. The configuration from the previous section (1.1.2) already includes the necessary theme variables.

### 2.2 DaisyUI Theme Configuration
Add the LEGO theme configuration to the DaisyUI plugin in `assets/css/app.css`:

```css
/* DaisyUI Theme Configuration */
@plugin "../vendor/daisyui-theme" {
  name: "lego";
  default: true;
  prefersdark: false;
  color-scheme: "light";
  --color-primary: #3B82F6;
  --color-primary-focus: #2563EB;
  --color-primary-content: #FFFFFF;
  
  --color-secondary: #8B5CF6;
  --color-secondary-focus: #7C3AED;
  --color-secondary-content: #FFFFFF;
  
  --color-accent: #10B981;
  --color-accent-focus: #059669;
  --color-accent-content: #FFFFFF;
  
  --color-neutral: #374151;
  --color-neutral-focus: #1F2937;
  --color-neutral-content: #FFFFFF;
  
  --color-base-100: #FFFFFF;
  --color-base-200: #F3F4F6;
  --color-base-300: #E5E7EB;
  --color-base-content: #1F2937;
  
  --color-info: #3ABFF8;
  --color-success: #36D399;
  --color-warning: #FBBD23;
  --color-error: #F87272;
  
  --radius-box: 0.5rem;
  --radius-btn: 0.25rem;
  --radius-badge: 0.125rem;
  --animation-btn: 0.25s;
  --animation-input: 0.2s;
  --btn-text-case: none;
  --btn-focus-scale: 0.95;
  --border: 1px;
  --tab-border: 1px;
  --tab-radius: 0.25rem;
}
```

### 2.3 Container Queries Plugin
Container queries are part of standard CSS and don't require a separate plugin in Tailwind CSS 4.0. The container query styles are already included in the widget definitions above.

---

## 3. PHOENIX COMPONENT ARCHITECTURE

### 3.1 Create Component Directory Structure
Create the following directory structure:

```
lib/demostarter_web/components/
├── lego/
│   ├── base_widget.ex      # Base widget with compile-time validation
│   ├── containers.ex        # Container widgets for layout (not raw containers)
│   ├── layouts.ex          # Page-level layout widgets
│   ├── validation.ex       # Shared validation logic
│   └── widgets/            # Atomic widget implementations (Phase 2)
│       ├── button.ex       # Button widget wrapping DaisyUI btn
│       ├── input.ex        # Input widget wrapping DaisyUI input
│       ├── card.ex         # Card widget wrapping DaisyUI card
│       └── text.ex         # Text widget for typography
```

### 3.2 Base Widget Component Implementation
**File:** `lib/demostarter_web/components/lego/base_widget.ex`

```elixir
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
```

### 3.3 Container Components
**File:** `lib/demostarter_web/components/lego/containers.ex`

```elixir
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
```

### 3.4 Layout Components
**File:** `lib/demostarter_web/components/lego/layouts.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts do
  @moduledoc """
  High-level layout components for common page patterns.
  """
  
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.Containers
  
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
```

### 3.5 Validation Module
**File:** `lib/demostarter_web/components/lego/validation.ex`

```elixir
defmodule DemostarterWeb.Components.Lego.Validation do
  @moduledoc """
  Compile-time validation for LEGO components.
  """
  
  @valid_sizes ~w(1x1 2x1 2x2 3x1 3x2 4x1 4x2 6x1 6x2 12x1 12x2)
  @valid_themes ~w(default primary secondary accent success warning error)
  
  @doc """
  Validates widget size at compile time.
  Raises compilation error if size is invalid.
  """
  defmacro validate_widget_size!(size) when is_binary(size) do
    unless size in @valid_sizes do
      raise CompileError,
        description: """
        Invalid widget size: #{inspect(size)}
        
        Valid sizes are: #{@valid_sizes |> Enum.join(", ")}
        
        Widget sizes follow the format "columns x rows" where:
        - columns: 1, 2, 3, 4, 6, or 12
        - rows: 1 or 2
        
        Examples: "2x1" (2 columns, 1 row), "4x2" (4 columns, 2 rows)
        """
    end
    quote do: :ok
  end
  
  # Runtime validation for dynamic sizes
  defmacro validate_widget_size!(size) do
    quote do
      unless unquote(size) in unquote(@valid_sizes) do
        raise ArgumentError, """
        Invalid widget size: #{inspect(unquote(size))}
        Valid sizes are: #{unquote(@valid_sizes) |> Enum.join(", ")}
        """
      end
      :ok
    end
  end
  
  @doc """
  Returns list of valid widget sizes.
  """
  def valid_sizes, do: @valid_sizes
  
  @doc """
  Returns list of valid themes.
  """
  def valid_themes, do: @valid_themes
  
  @doc """
  Checks if a size is valid.
  """
  def valid_size?(size), do: size in @valid_sizes
  
  @doc """
  Checks if a theme is valid.
  """
  def valid_theme?(theme), do: theme in @valid_themes
end
```

---

## 4. MODIFY CORE COMPONENTS

### 4.1 Update Core Components
**File:** `lib/demostarter_web/components/core_components.ex`

Add imports at the top of the module:

```elixir
defmodule DemostarterWeb.CoreComponents do
  use Phoenix.Component
  
  # Import LEGO components
  import DemostarterWeb.Components.Lego.BaseWidget
  import DemostarterWeb.Components.Lego.Containers
  import DemostarterWeb.Components.Lego.Layouts
  
  # ... rest of the module
end
```

Update any existing grid-based components to use LEGO containers instead of raw grid classes.

### 4.2 Update Application Layout
**File:** `lib/demostarter_web/components/layouts/app.html.heex`

Update the main content wrapper:

```heex
<!DOCTYPE html>
<html lang="en" data-theme="lego">
  <head>
    <!-- existing head content -->
  </head>
  <body>
    <!-- existing navbar/header -->
    
    <main class="lego-main">
      <%= @inner_content %>
    </main>
    
    <!-- existing footer if any -->
  </body>
</html>
```

### 4.3 Update Root Layout
**File:** `lib/demostarter_web/components/layouts/root.html.heex`

Ensure the HTML element has proper theme and container query support:

```heex
<!DOCTYPE html>
<html lang="en" style="scrollbar-gutter: stable;" data-theme="lego">
  <!-- rest of the template -->
</html>
```

---

## 5. CREATE VALIDATION INFRASTRUCTURE

### 5.1 Mix Task for LEGO Validation
**File:** `lib/mix/tasks/lego.validate.ex`

```elixir
defmodule Mix.Tasks.Lego.Validate do
  @moduledoc """
  Validates LEGO component usage across the codebase.
  
  ## Usage
  
      mix lego.validate
      mix lego.validate --strict
  
  Options:
    --strict  Fail on warnings as well as errors
  """
  
  use Mix.Task
  
  @shortdoc "Validates LEGO component usage"
  
  # NO classes allowed in templates - empty list
  @allowed_classes []
  
  # NO utility prefixes allowed - developers must use widgets only
  @allowed_utility_prefixes []
  
  def run(args) do
    {opts, _} = OptionParser.parse!(args, strict: [strict: :boolean])
    
    Mix.shell().info("Validating LEGO component usage...")
    
    issues = 
      find_heex_files()
      |> Enum.flat_map(&validate_file/1)
    
    if Enum.empty?(issues) do
      Mix.shell().info("✅ All LEGO validations passed!")
    else
      Enum.each(issues, fn {file, line, issue} ->
        Mix.shell().error("#{file}:#{line} - #{issue}")
      end)
      
      if opts[:strict] || has_errors?(issues) do
        Mix.raise("LEGO validation failed!")
      end
    end
  end
  
  defp find_heex_files do
    Path.wildcard("lib/**/*.{heex,ex}")
  end
  
  defp validate_file(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.with_index(1)
    |> Enum.flat_map(fn {line, line_num} ->
      validate_line(file, line, line_num)
    end)
  end
  
  defp validate_line(file, line, line_num) do
    issues = []
    
    # Check for ANY CSS classes in templates
    if line =~ ~r/class=/ && !widget_implementation_file?(file) do
      classes = extract_classes(line)
      
      if not Enum.empty?(classes) do
        issue = "CSS classes not allowed in templates. Use widgets only: #{Enum.join(classes, ", ")}"
        issues = [{file, line_num, issue} | issues]
      end
    end
    
    # Check for raw HTML elements
    if line =~ ~r/<(div|span|button|input|table|tr|td|th|ul|li|h[1-6]|p|a|img|svg)/ && !widget_implementation_file?(file) do
      issue = "Raw HTML elements not allowed. Use widget components only."
      issues = [{file, line_num, issue} | issues]
    end
    
    # Check for invalid widget sizes
    if line =~ ~r/size=["']([^"']+)["']/ do
      size = Regex.run(~r/size=["']([^"']+)["']/, line, capture: :all_but_first)
      if size && !valid_size?(hd(size)) do
        issues = [{file, line_num, "Invalid widget size: #{hd(size)}"} | issues]
      end
    end
    
    issues
  end
  
  defp extract_classes(line) do
    case Regex.run(~r/class=["']([^"']+)["']/, line) do
      [_, classes] -> String.split(classes)
      _ -> []
    end
  end
  
  defp widget_implementation_file?(file) do
    # Only widget implementation files can use CSS classes
    String.contains?(file, "components/lego/widgets/") ||
    String.contains?(file, "components/lego/base_widget.ex")
  end
  
  defp valid_size?(size) do
    size in DemostarterWeb.Components.Lego.Validation.valid_sizes()
  end
  
  defp has_errors?(issues) do
    Enum.any?(issues, fn {_, _, issue} ->
      String.contains?(issue, ["Invalid", "Unauthorized"])
    end)
  end
end
```

### 5.2 Add Custom Credo Check
**File:** `lib/credo_checks/lego_component_check.ex`

```elixir
defmodule CredoChecks.LegoComponentCheck do
  @moduledoc """
  Checks for LEGO component compliance in Phoenix templates.
  """
  
  use Credo.Check,
    base_priority: :high,
    category: :design,
    tags: [:lego]
  
  @valid_sizes ~w(1x1 2x1 2x2 3x1 3x2 4x1 4x2 6x1 6x2 12x1 12x2)
  
  def run(source_file, params \\ []) do
    issue_meta = IssueMeta.for(source_file, params)
    
    source_file
    |> SourceFile.source()
    |> find_issues(issue_meta)
  end
  
  defp find_issues(source, issue_meta) do
    ~r/size=["']([^"']+)["']/
    |> Regex.scan(source, return: :index)
    |> Enum.flat_map(fn [{start, length}, {size_start, size_length}] ->
      size = String.slice(source, size_start, size_length)
      
      if size not in @valid_sizes do
        line_no = SourceFile.line_at(source, start)
        column = SourceFile.column_at(source, start)
        
        [issue_for(issue_meta, line_no, column, size)]
      else
        []
      end
    end)
  end
  
  defp issue_for(issue_meta, line_no, column, size) do
    format_issue(
      issue_meta,
      message: "Invalid LEGO widget size: #{size}. Valid sizes are: #{Enum.join(@valid_sizes, ", ")}",
      line_no: line_no,
      column: column,
      trigger: size
    )
  end
end
```

### 5.3 Update Credo Configuration
**File:** `.credo.exs`

Add the custom check to your Credo configuration:

```elixir
%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/"],
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      checks: [
        # ... existing checks ...
        
        # LEGO System Checks
        {CredoChecks.LegoComponentCheck, []},
      ]
    }
  ]
}
```

---

## 6. DEMO AND TESTING SETUP

### 6.1 Create LEGO Demo LiveView
**File:** `lib/demostarter_web/live/lego_demo_live.ex`

**NOTE: This demo shows the current Phase 1 state. In Phase 2, we'll replace all raw HTML and DaisyUI classes with atomic widgets.**

```elixir
defmodule DemostarterWeb.LegoDemoLive do
  @moduledoc """
  Interactive demonstration of the LEGO UI system components.
  """
  
  use DemostarterWeb, :live_view
  
  import DemostarterWeb.Components.Lego.BaseWidget
  import DemostarterWeb.Components.Lego.Containers
  import DemostarterWeb.Components.Lego.Layouts
  
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
```

### 6.2 Create Widget Component Examples
**File:** `lib/demostarter_web/components/lego/widgets/metric.ex`

```elixir
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
  attr :trend, :atom, values: [:up, :down, :neutral], default: nil
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
```

### 6.3 Add Routes
**File:** `lib/demostarter_web/router.ex`

Add to the live routes section:

```elixir
scope "/", DemostarterWeb do
  pipe_through :browser
  
  # ... existing routes ...
  
  # LEGO UI System Demo
  live "/lego-demo", LegoDemoLive, :index
end
```

---

## 7. CLEANUP AND MIGRATION

### 7.1 Remove Deprecated CSS
Create a cleanup script to identify old CSS usage:

**File:** `lib/mix/tasks/lego.cleanup.ex`

```elixir
defmodule Mix.Tasks.Lego.Cleanup do
  @moduledoc """
  Identifies old CSS patterns that should be migrated to LEGO system.
  """
  
  use Mix.Task
  
  @shortdoc "Find CSS patterns to migrate to LEGO system"
  
  @deprecated_patterns [
    {~r/grid-cols-\d+/, "Use lego-container instead"},
    {~r/flex\s+flex-col/, "Use lego-widget structure"},
    {~r/space-[xy]-\d+/, "Use lego-gap utilities"},
    {~r/p-\d+/, "Use lego-pad-* utilities"},
    {~r/m-\d+/, "Use lego-space-* utilities"},
  ]
  
  def run(_) do
    Mix.shell().info("Scanning for deprecated CSS patterns...")
    
    issues = find_deprecated_patterns()
    
    if Enum.empty?(issues) do
      Mix.shell().info("✅ No deprecated patterns found!")
    else
      Mix.shell().info("\nFound #{length(issues)} deprecated patterns:\n")
      
      Enum.each(issues, fn {file, line_num, pattern, suggestion} ->
        Mix.shell().info("#{file}:#{line_num}")
        Mix.shell().info("  Pattern: #{pattern}")
        Mix.shell().info("  Suggestion: #{suggestion}\n")
      end)
    end
  end
  
  defp find_deprecated_patterns do
    Path.wildcard("lib/**/*.{heex,ex}")
    |> Enum.flat_map(&scan_file/1)
  end
  
  defp scan_file(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.with_index(1)
    |> Enum.flat_map(fn {line, line_num} ->
      check_line(file, line, line_num)
    end)
  end
  
  defp check_line(file, line, line_num) do
    Enum.flat_map(@deprecated_patterns, fn {pattern, suggestion} ->
      if line =~ pattern do
        matches = Regex.scan(pattern, line)
        Enum.map(matches, fn [match] ->
          {file, line_num, match, suggestion}
        end)
      else
        []
      end
    end)
  end
end
```

### 7.2 Migration Guide
Create a migration guide for developers:

**File:** `docs/LEGO_MIGRATION.md`

```markdown
# LEGO UI System Migration Guide

## Overview
This guide helps migrate existing components to the LEGO UI system.

## Migration Steps

### 1. Replace Grid Layouts
**Before:**
```heex
<div class="grid grid-cols-3 gap-4">
  <div class="col-span-1">Content</div>
  <div class="col-span-2">Content</div>
</div>
```

**After:**
```heex
<.lego_container>
  <.lego_widget size="4x1" title="Title">Content</.lego_widget>
  <.lego_widget size="8x1" title="Title">Content</.lego_widget>
</.lego_container>
```

### 2. Update Spacing
- Replace `p-4` with widget padding (automatic)
- Replace `m-4` with `lego-space-4`
- Replace `gap-4` with LEGO container gaps (automatic)

### 3. Update Components
All components must be wrapped in `<.lego_widget>` with valid sizes.

### 4. Run Validation
```bash
mix lego.validate --strict
```
```

---

## 8. DOCUMENTATION

### 8.1 Update CLAUDE.md
Add the following section to `CLAUDE.md`:

```markdown
## LEGO UI System

The project uses a constrained LEGO-style UI system that enforces design consistency through compile-time validation. **IMPORTANT: Every UI element must be a widget. No direct HTML, CSS classes, or DaisyUI components are allowed in templates.**

### Key Concepts

1. **Widget-Only Development**: ALL UI elements must be widgets - no exceptions
2. **12-Column Grid**: All layouts use a 12-column CSS Grid system
3. **Fixed Widget Sizes**: Only specific size combinations are allowed
4. **Compile-time Validation**: Invalid sizes and non-widget usage cause compilation errors
5. **Container Queries**: Widgets respond to their container size

### Widget Sizes

Only these widget sizes are allowed:
- **1x1**: Status indicators, small metrics
- **2x1**: Key metrics, small stats
- **2x2**: Medium content, small charts
- **3x1**: User info, activity cards
- **3x2**: Lists, medium charts
- **4x1**: Wide cards, CTAs
- **4x2**: Large visualizations
- **6x1**: Half-width sections
- **6x2**: Large dashboards
- **12x1**: Full-width banners
- **12x2**: Full-width extended content

### Development Rules

1. **NO HTML elements** in templates (no `<div>`, `<button>`, etc.)
2. **NO CSS classes** in templates (no `class="..."` at all)
3. **NO DaisyUI components** in templates (use widget wrappers)
4. **ONLY widgets** can be used to build UI
5. Run `mix lego.validate` before committing

### Component Usage

```heex
<!-- Phase 1 (temporary - sets up foundation) -->
<.lego_container>
  <.lego_widget size="2x1" title="Revenue">
    <div>$42,000</div>  <!-- Raw HTML temporarily allowed in Phase 1 -->
  </.lego_widget>
</.lego_container>

<!-- Phase 2 (final - everything is a widget) -->
<.container_widget>
  <.card_widget size="2x1" title="Revenue">
    <.text_widget size="2xl" weight="bold">$42,000</.text_widget>
  </.card_widget>
</.container_widget>
```

### Validation Commands

```bash
mix lego.validate        # Check for violations
mix lego.cleanup        # Find deprecated patterns
mix compile            # Compile-time size validation
```
```

### 8.2 Create Quick Reference Card
**File:** `docs/LEGO_QUICK_REFERENCE.md`

```markdown
# LEGO UI System Quick Reference

## Widget Sizes Visual Guide

```
1x1  2x1    3x1      4x1        6x1              12x1
┌─┐  ┌──┐   ┌───┐    ┌────┐     ┌──────┐         ┌────────────┐
│ │  │  │   │   │    │    │     │      │         │            │
└─┘  └──┘   └───┘    └────┘     └──────┘         └────────────┘

2x2  3x2    4x2      6x2        12x2
┌──┐ ┌───┐  ┌────┐   ┌──────┐   ┌────────────┐
│  │ │   │  │    │   │      │   │            │
│  │ │   │  │    │   │      │   │            │
└──┘ └───┘  └────┘   └──────┘   └────────────┘
```

## Component Structure

```heex
<!-- Basic Widget -->
<.lego_widget size="2x1" title="Title">
  Content
</.lego_widget>

<!-- Widget with Actions -->
<.lego_widget size="4x2" title="Chart">
  <:actions>
    <button class="btn btn-xs">Export</button>
  </:actions>
  <canvas id="chart"></canvas>
  <:footer>
    Last updated: 5 min ago
  </:footer>
</.lego_widget>

<!-- Dashboard Layout -->
<.dashboard_layout title="Dashboard">
  <:metrics>
    <!-- Metric widgets -->
  </:metrics>
  <:charts>
    <!-- Chart widgets -->
  </:charts>
</.dashboard_layout>
```


## Spacing Units

- `--lego-unit`: 4px
- `--lego-unit-2`: 8px
- `--lego-unit-4`: 16px (standard gap)
- `--lego-unit-6`: 24px
- `--lego-unit-8`: 32px

## Responsive Behavior

- **Mobile (<768px)**: All widgets stack to full width
- **Tablet (768-1024px)**: 6-column grid
- **Desktop (>1024px)**: Full 12-column grid

## DaisyUI Integration

Use DaisyUI components inside LEGO widgets:
- Buttons: `btn`, `btn-primary`, etc.
- Forms: `input`, `select`, `checkbox`
- Feedback: `alert`, `toast`, `modal`
- Data: `table`, `stat`, `badge`
```

---

## 9. VERIFICATION CHECKLIST

Before marking Phase 1 as complete, ensure:

- [ ] **CSS Foundation**
  - [ ] app.css contains only LEGO system styles
  - [ ] All CSS variables defined
  - [ ] Grid system working correctly
  - [ ] Container queries functional

- [ ] **Tailwind Configuration**
  - [ ] Container queries plugin installed
  - [ ] LEGO theme defined
  - [ ] Spacing utilities configured
  - [ ] Safelist patterns added

- [ ] **Component Architecture**
  - [ ] Base widget component created
  - [ ] Size validation working at compile-time
  - [ ] Container components implemented
  - [ ] Layout components ready

- [ ] **Validation Infrastructure**
  - [ ] Mix task `lego.validate` working
  - [ ] Credo check configured
  - [ ] Compile-time errors for invalid sizes

- [ ] **Demo and Testing**
  - [ ] Demo page accessible at `/lego-demo`
  - [ ] All widget sizes displayed
  - [ ] Interactive examples working
  - [ ] Responsive behavior verified

- [ ] **Documentation**
  - [ ] CLAUDE.md updated
  - [ ] Quick reference created
  - [ ] Migration guide written
  - [ ] Code comments added

- [ ] **Integration**
  - [ ] Existing pages still functional
  - [ ] No console errors
  - [ ] Theme switching works
  - [ ] DaisyUI components compatible

## 10. NEXT STEPS

After Phase 1 is complete, proceed to:

1. **Phase 2**: Create atomic widget wrappers for ALL DaisyUI components
   - button_widget, input_widget, text_widget, etc.
   - Update all examples to use only widgets
   - Enforce widget-only validation
2. **Phase 3**: Advanced layouts and page templates (widget-based)
3. **Phase 4**: Enhanced validation and CI/CD integration
4. **Phase 5**: Interactive features and real-time updates
5. **Phase 6**: Storybook documentation and component library

---

This completes the detailed Phase 1 implementation plan for the LEGO-style UI foundation in the Demostarter project.