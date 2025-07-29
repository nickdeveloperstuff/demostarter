# PHASE 3: LAYOUT SYSTEM - DETAILED IMPLEMENTATION PLAN

## Overview

This document provides the implementation plan for Phase 3 of the LEGO-style UI system. Building on the grid foundation (Phase 1) and widget components (Phase 2), Phase 3 focuses on layout patterns and page composition. Layouts are grid containers where widgets can be placed - with empty space being a valid and often important design element.

## Goals

- Define common layout patterns for widget placement
- Create reusable page templates using slot-based composition
- Establish responsive strategies that maintain widget-only content
- Provide clear patterns for using empty space effectively
- Maintain simplicity without complex abstractions

---

## 1. LAYOUT FUNDAMENTALS

### 1.1 Understanding the Grid System

The 12-column grid from Phase 1 serves as the foundation for all layouts:

```
┌─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┐
│1│2│3│4│5│6│7│8│9│10│11│12│  ← 12 columns
└─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┘

Widgets can span multiple columns:
┌─────┬─────┬───────────┐
│ 2x1 │ 2x1 │    4x1    │  ← 8 of 12 columns used
└─────┴─────┴───────────┘     4 columns empty
```

### 1.2 Key Principles

1. **Layouts are containers** - They define the grid structure
2. **Only widgets go in layouts** - No raw HTML or text
3. **Empty space is valid** - Not every column needs content
4. **Widgets snap to grid** - Automatic alignment
5. **Responsive by default** - Grid adapts to screen size

### 1.3 Layout Widget Enhancement

Update the base container from Phase 1 to better support layout patterns:

**File:** `lib/demostarter_web/components/lego/containers.ex`

Add layout-specific container variants:

```elixir
defmodule DemostarterWeb.Components.Lego.Containers do
  # ... existing code ...
  
  @doc """
  Layout container with common patterns.
  """
  attr :layout, :string, default: "default", 
    values: ~w(default centered sidebar two-column)
  attr :max_width, :string, default: "full",
    values: ~w(sm md lg xl 2xl full)
  
  def layout_container(assigns) do
    ~H"""
    <div class={layout_wrapper_class(@layout, @max_width)}>
      <div class={[
        "lego-container",
        layout_grid_class(@layout)
      ]}>
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end
  
  defp layout_wrapper_class("centered", max_width) do
    ["mx-auto", max_width_class(max_width)]
  end
  defp layout_wrapper_class(_, _), do: ""
  
  defp layout_grid_class("sidebar"), do: "lg:grid-cols-[300px_1fr]"
  defp layout_grid_class("two-column"), do: "lg:grid-cols-2"
  defp layout_grid_class(_), do: ""
  
  defp max_width_class("sm"), do: "max-w-screen-sm"
  defp max_width_class("md"), do: "max-w-screen-md"
  defp max_width_class("lg"), do: "max-w-screen-lg"
  defp max_width_class("xl"), do: "max-w-screen-xl"
  defp max_width_class("2xl"), do: "max-w-screen-2xl"
  defp max_width_class("full"), do: ""
end
```

---

## 2. DASHBOARD LAYOUT PATTERNS

### 2.1 Metrics Dashboard

A common pattern with key metrics at the top and visualizations below:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.MetricsDashboard do
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.{Containers, Widgets.Text}
  
  attr :title, :string, required: true
  
  slot :metrics, doc: "Metric widgets (typically 2x1 or 3x1)"
  slot :primary_chart, doc: "Main visualization (typically 8x2)"
  slot :secondary_charts, doc: "Supporting charts (typically 4x2)"
  slot :actions, doc: "Header action buttons"
  
  def metrics_dashboard(assigns) do
    ~H"""
    <.layout_container>
      <!-- Header Row -->
      <.container_widget display="flex" justify="between" align="center" class="col-span-12 mb-6">
        <.text_widget size="2xl" weight="bold"><%= @title %></.text_widget>
        <.container_widget display="flex" gap="2">
          <%= render_slot(@actions) %>
        </.container_widget>
      </.container_widget>
      
      <!-- Metrics Row - typically uses 8-10 of 12 columns -->
      <%= render_slot(@metrics) %>
      
      <!-- Spacer - empty columns for visual breathing room -->
      <div class="col-span-12 h-8"></div>
      
      <!-- Primary Chart - 8 columns with 4 empty -->
      <div class="col-span-12 lg:col-span-8">
        <%= render_slot(@primary_chart) %>
      </div>
      
      <!-- Secondary Charts Row -->
      <div class="col-span-12 h-8"></div>
      <%= render_slot(@secondary_charts) %>
    </.layout_container>
    """
  end
end
```

**Usage Example:**
```heex
<.metrics_dashboard title="Sales Analytics">
  <:metrics>
    <.card_widget size="3x1">
      <.stat_widget label="Revenue" value="$125K" trend="+12%" />
    </.card_widget>
    <.card_widget size="3x1">
      <.stat_widget label="Orders" value="1,234" trend="+5%" />
    </.card_widget>
    <.card_widget size="3x1">
      <.stat_widget label="Customers" value="856" trend="+18%" />
    </.card_widget>
    <!-- 3 columns empty for balance -->
  </:metrics>
  
  <:primary_chart>
    <.chart_widget type="line" title="Revenue Trend" />
  </:primary_chart>
  
  <:secondary_charts>
    <.card_widget size="4x2">
      <.chart_widget type="bar" title="Top Products" />
    </.card_widget>
    <.card_widget size="4x2">
      <.chart_widget type="pie" title="Customer Segments" />
    </.card_widget>
    <!-- 4 columns empty -->
  </:secondary_charts>
</.metrics_dashboard>
```

### 2.2 Admin Dashboard

Sidebar navigation with content area:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.AdminDashboard do
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.{Containers, Widgets.Text}
  
  attr :title, :string, required: true
  attr :user_name, :string, required: true
  
  slot :navigation, required: true
  slot :content, required: true
  slot :header_actions
  
  def admin_dashboard(assigns) do
    ~H"""
    <.layout_container layout="sidebar">
      <!-- Sidebar - fixed width -->
      <nav class="lg:col-span-1 col-span-12 bg-base-200 min-h-screen p-4">
        <.container_widget display="flex" direction="col" gap="6">
          <!-- Logo/Brand -->
          <.text_widget size="xl" weight="bold" class="mb-4">
            Admin Panel
          </.text_widget>
          
          <!-- Navigation -->
          <%= render_slot(@navigation) %>
          
          <!-- User info at bottom -->
          <.container_widget class="mt-auto pt-6 border-t">
            <.text_widget size="sm"><%= @user_name %></.text_widget>
          </.container_widget>
        </.container_widget>
      </nav>
      
      <!-- Main Content Area -->
      <main class="lg:col-span-1 col-span-12">
        <.container_widget padding="6">
          <!-- Page Header -->
          <.container_widget display="flex" justify="between" align="center" class="mb-6">
            <.text_widget size="2xl" weight="bold"><%= @title %></.text_widget>
            <.container_widget display="flex" gap="2">
              <%= render_slot(@header_actions) %>
            </.container_widget>
          </.container_widget>
          
          <!-- Content -->
          <%= render_slot(@content) %>
        </.container_widget>
      </main>
    </.layout_container>
    """
  end
end
```

### 2.3 Analytics Dashboard

Data-heavy layout with multiple visualizations:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.AnalyticsDashboard do
  use Phoenix.Component
  import DemostarterWeb.Components.Lego.Containers
  
  slot :filters, doc: "Filter controls"
  slot :summary, doc: "Summary cards"
  slot :charts, doc: "Chart widgets"
  slot :tables, doc: "Data tables"
  
  def analytics_dashboard(assigns) do
    ~H"""
    <.layout_container>
      <!-- Filters Row -->
      <div class="col-span-12 mb-6">
        <.card_widget>
          <.container_widget display="flex" gap="4" align="center">
            <%= render_slot(@filters) %>
          </.container_widget>
        </.card_widget>
      </div>
      
      <!-- Summary Cards - intentionally sparse -->
      <%= render_slot(@summary) %>
      <div class="col-span-2"></div> <!-- Empty space for visual balance -->
      
      <!-- Charts Section -->
      <div class="col-span-12 h-8"></div> <!-- Spacer -->
      <%= render_slot(@charts) %>
      
      <!-- Tables Section -->
      <div class="col-span-12 h-8"></div> <!-- Spacer -->
      <%= render_slot(@tables) %>
    </.layout_container>
    """
  end
end
```

---

## 3. PAGE LAYOUT TEMPLATES

### 3.1 List Page Template

Common pattern for displaying lists of data:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.ListPage do
  use Phoenix.Component
  
  attr :title, :string, required: true
  attr :description, :string, default: nil
  
  slot :actions, doc: "Page-level actions (New button, etc.)"
  slot :filters, doc: "Filter controls"
  slot :table, required: true, doc: "Table widget"
  slot :pagination, doc: "Pagination controls"
  slot :empty_state, doc: "What to show when no data"
  
  def list_page(assigns) do
    ~H"""
    <.layout_container>
      <!-- Header -->
      <header class="col-span-12 mb-6">
        <.container_widget display="flex" justify="between" align="start">
          <.container_widget>
            <.text_widget size="2xl" weight="bold"><%= @title %></.text_widget>
            <.text_widget :if={@description} size="sm" color="neutral">
              <%= @description %>
            </.text_widget>
          </.container_widget>
          <.container_widget display="flex" gap="2">
            <%= render_slot(@actions) %>
          </.container_widget>
        </.container_widget>
      </header>
      
      <!-- Filters -->
      <div :if={@filters != []} class="col-span-12 mb-4">
        <.card_widget>
          <.container_widget display="flex" gap="4">
            <%= render_slot(@filters) %>
          </.container_widget>
        </.card_widget>
      </div>
      
      <!-- Table or Empty State -->
      <div class="col-span-12">
        <%= if @empty_state != [] do %>
          <.card_widget>
            <.container_widget class="py-12 text-center">
              <%= render_slot(@empty_state) %>
            </.container_widget>
          </.card_widget>
        <% else %>
          <%= render_slot(@table) %>
        <% end %>
      </div>
      
      <!-- Pagination -->
      <div :if={@pagination != []} class="col-span-12 mt-4">
        <.container_widget display="flex" justify="center">
          <%= render_slot(@pagination) %>
        </.container_widget>
      </div>
    </.layout_container>
    """
  end
end
```

### 3.2 Detail Page Template

For showing detailed information about a single item:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.DetailPage do
  use Phoenix.Component
  
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  
  slot :breadcrumbs, doc: "Navigation breadcrumbs"
  slot :actions, doc: "Page actions (Edit, Delete, etc.)"
  slot :main_content, required: true, doc: "Primary content area"
  slot :sidebar, doc: "Optional sidebar content"
  slot :related, doc: "Related items section"
  
  def detail_page(assigns) do
    ~H"""
    <.layout_container>
      <!-- Breadcrumbs -->
      <nav :if={@breadcrumbs != []} class="col-span-12 mb-4">
        <%= render_slot(@breadcrumbs) %>
      </nav>
      
      <!-- Header -->
      <header class="col-span-12 mb-6">
        <.container_widget display="flex" justify="between" align="start">
          <.container_widget>
            <.text_widget size="2xl" weight="bold"><%= @title %></.text_widget>
            <.text_widget :if={@subtitle} size="base" color="neutral">
              <%= @subtitle %>
            </.text_widget>
          </.container_widget>
          <.container_widget display="flex" gap="2">
            <%= render_slot(@actions) %>
          </.container_widget>
        </.container_widget>
      </header>
      
      <!-- Main Content with Optional Sidebar -->
      <div class={@sidebar != [] && "lg:col-span-8" || "lg:col-span-10"}>
        <%= render_slot(@main_content) %>
      </div>
      
      <!-- Sidebar -->
      <aside :if={@sidebar != []} class="lg:col-span-4">
        <%= render_slot(@sidebar) %>
      </aside>
      
      <!-- Empty columns for centered appearance when no sidebar -->
      <div :if={@sidebar == []} class="lg:col-span-1"></div>
      
      <!-- Related Items -->
      <div :if={@related != []} class="col-span-12 mt-8">
        <.text_widget size="lg" weight="semibold" class="mb-4">
          Related Items
        </.text_widget>
        <%= render_slot(@related) %>
      </div>
    </.layout_container>
    """
  end
end
```

### 3.3 Form Page Template

Centered form layout with optional help content:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.FormPage do
  use Phoenix.Component
  
  attr :title, :string, required: true
  attr :description, :string, default: nil
  attr :max_width, :string, default: "md", values: ~w(sm md lg)
  
  slot :form, required: true
  slot :help, doc: "Help content shown beside form on large screens"
  slot :actions, required: true, doc: "Form submit/cancel buttons"
  
  def form_page(assigns) do
    ~H"""
    <.layout_container layout="centered" max_width={@max_width}>
      <!-- Centered Form -->
      <div class="col-span-12 lg:col-start-2 lg:col-span-10 xl:col-start-3 xl:col-span-8">
        <.card_widget>
          <!-- Form Header -->
          <.container_widget class="mb-6">
            <.text_widget size="xl" weight="bold" align="center">
              <%= @title %>
            </.text_widget>
            <.text_widget :if={@description} size="sm" color="neutral" align="center">
              <%= @description %>
            </.text_widget>
          </.container_widget>
          
          <!-- Form Content -->
          <.container_widget display="flex" direction="col" gap="4">
            <%= render_slot(@form) %>
            
            <!-- Form Actions -->
            <.divider_widget />
            <.container_widget display="flex" justify="end" gap="2">
              <%= render_slot(@actions) %>
            </.container_widget>
          </.container_widget>
        </.card_widget>
        
        <!-- Help Content -->
        <div :if={@help != []} class="mt-6">
          <.card_widget>
            <%= render_slot(@help) %>
          </.card_widget>
        </div>
      </div>
    </.layout_container>
    """
  end
end
```

### 3.4 Settings Page Template

Tab-based layout for settings/configuration:

```elixir
defmodule DemostarterWeb.Components.Lego.Layouts.SettingsPage do
  use Phoenix.Component
  
  attr :title, :string, default: "Settings"
  attr :active_tab, :string, required: true
  
  slot :tabs, required: true, doc: "Tab navigation items"
  slot :content, required: true, doc: "Active tab content"
  
  def settings_page(assigns) do
    ~H"""
    <.layout_container>
      <!-- Page Title -->
      <header class="col-span-12 mb-6">
        <.text_widget size="2xl" weight="bold"><%= @title %></.text_widget>
      </header>
      
      <!-- Tab Navigation -->
      <nav class="col-span-12 lg:col-span-3">
        <.card_widget>
          <.container_widget display="flex" direction="col" gap="1">
            <%= render_slot(@tabs) %>
          </.container_widget>
        </.card_widget>
      </nav>
      
      <!-- Tab Content -->
      <div class="col-span-12 lg:col-span-8 lg:col-start-4">
        <.card_widget>
          <%= render_slot(@content) %>
        </.card_widget>
      </div>
      
      <!-- Empty column for balance -->
      <div class="lg:col-span-1"></div>
    </.layout_container>
    """
  end
end
```

---

## 4. ADVANCED LAYOUT TECHNIQUES

### 4.1 Using Empty Space Effectively

Empty columns serve important purposes:

1. **Visual breathing room** - Prevents cramped interfaces
2. **Content emphasis** - Isolates important elements
3. **Alignment** - Centers content without CSS tricks
4. **Rhythm** - Creates consistent visual patterns

**Example: Centered Content with Side Margins**
```heex
<.lego_container>
  <div class="col-span-2"></div> <!-- Empty left margin -->
  <.card_widget size="8x2">
    <!-- Centered content -->
  </.card_widget>
  <div class="col-span-2"></div> <!-- Empty right margin -->
</.lego_container>
```

### 4.2 Asymmetric Layouts

Not everything needs to be centered:

```heex
<.lego_container>
  <!-- Main content takes 7 columns -->
  <.card_widget size="7x2">
    <.text_widget>Main focus area</.text_widget>
  </.card_widget>
  
  <!-- 1 column gap -->
  <div class="col-span-1"></div>
  
  <!-- Secondary content takes 4 columns -->
  <.card_widget size="4x2">
    <.text_widget>Supporting info</.text_widget>
  </.card_widget>
</.lego_container>
```

### 4.3 Progressive Disclosure

Show more content as screen size allows:

```elixir
def responsive_layout(assigns) do
  ~H"""
  <.lego_container>
    <!-- Always visible on all screens -->
    <.card_widget class="col-span-12 lg:col-span-6">
      <.text_widget>Primary content</.text_widget>
    </.card_widget>
    
    <!-- Hidden on mobile, visible on larger screens -->
    <.card_widget class="hidden lg:block lg:col-span-4">
      <.text_widget>Secondary content</.text_widget>
    </.card_widget>
    
    <!-- Only on extra large screens -->
    <.card_widget class="hidden xl:block xl:col-span-2">
      <.text_widget>Tertiary content</.text_widget>
    </.card_widget>
  </.lego_container>
  """
end
```

---

## 5. RESPONSIVE GRID BEHAVIOR

### 5.1 Breakpoint Strategy

The grid system adapts at these breakpoints:

- **Mobile (< 768px)**: Single column, all widgets stack
- **Tablet (768px - 1024px)**: 6-column grid
- **Desktop (> 1024px)**: Full 12-column grid

### 5.2 Responsive Patterns

**Desktop Layout (12 columns):**
```
┌─────┬─────┬─────┬─────┐
│ 3x1 │ 3x1 │ 3x1 │ 3x1 │
└─────┴─────┴─────┴─────┘
```

**Tablet Layout (6 columns):**
```
┌───────┬───────┐
│  3x1  │  3x1  │
├───────┼───────┤
│  3x1  │  3x1  │
└───────┴───────┘
```

**Mobile Layout (1 column):**
```
┌─────┐
│ 3x1 │
├─────┤
│ 3x1 │
├─────┤
│ 3x1 │
├─────┤
│ 3x1 │
└─────┘
```

### 5.3 Container Queries

Widgets adapt based on their container size:

```css
/* Widget adapts to available space */
@container (max-width: 300px) {
  .lego-widget .text-2xl { font-size: 1.25rem; }
}

@container (min-width: 400px) {
  .lego-widget .text-2xl { font-size: 1.5rem; }
}
```

---

## 6. SLOT-BASED COMPOSITION

### 6.1 Named Slots for Regions

Layout widgets use named slots to organize content:

```elixir
def layout_with_slots(assigns) do
  ~H"""
  <div class="layout">
    <header :if={@header != []}>
      <%= render_slot(@header) %>
    </header>
    
    <nav :if={@navigation != []}>
      <%= render_slot(@navigation) %>
    </nav>
    
    <main>
      <%= render_slot(@content) %>
    </main>
    
    <aside :if={@sidebar != []}>
      <%= render_slot(@sidebar) %>
    </aside>
    
    <footer :if={@footer != []}>
      <%= render_slot(@footer) %>
    </footer>
  </div>
  """
end
```

### 6.2 Conditional Rendering

Slots can be optional and affect layout:

```elixir
# Layout adjusts based on presence of sidebar
<div class={@sidebar != [] && "col-span-8" || "col-span-12"}>
  <%= render_slot(@content) %>
</div>
```

---

## 7. REAL-WORLD EXAMPLES

### 7.1 SaaS Dashboard

Complete dashboard for a law firm SaaS:

```heex
<.admin_dashboard title="Case Dashboard" user_name="John Doe">
  <:navigation>
    <.nav_item_widget label="Dashboard" icon="home" active />
    <.nav_item_widget label="Cases" icon="folder" />
    <.nav_item_widget label="Clients" icon="users" />
    <.nav_item_widget label="Documents" icon="document" />
    <.nav_item_widget label="Billing" icon="credit-card" />
  </:navigation>
  
  <:content>
    <!-- Key Metrics Row -->
    <.container_widget display="grid" class="grid-cols-12 gap-4 mb-6">
      <.card_widget class="col-span-3">
        <.stat_widget label="Active Cases" value="28" icon="folder" />
      </.card_widget>
      <.card_widget class="col-span-3">
        <.stat_widget label="Total Clients" value="156" icon="users" />
      </.card_widget>
      <.card_widget class="col-span-3">
        <.stat_widget label="This Month" value="$45,230" icon="currency" />
      </.card_widget>
      <!-- 3 columns intentionally empty for breathing room -->
    </.container_widget>
    
    <!-- Recent Cases -->
    <.card_widget class="mb-6">
      <.table_widget>
        <:header>
          <.table_header_widget columns={["Case #", "Client", "Type", "Status", "Next Date"]} />
        </:header>
        <:row>
          <.table_row_widget>
            <.text_widget>2024-001</.text_widget>
            <.text_widget>Acme Corp</.text_widget>
            <.text_widget>Contract</.text_widget>
            <.badge_widget text="Active" variant="success" />
            <.text_widget>Jan 15, 2024</.text_widget>
          </.table_row_widget>
        </:row>
      </.table_widget>
    </.card_widget>
  </:content>
</.admin_dashboard>
```

### 7.2 Client Detail Page

```heex
<.detail_page title="Acme Corporation" subtitle="Corporate Client">
  <:breadcrumbs>
    <.breadcrumb_widget items={[
      {label: "Clients", url: "/clients"},
      {label: "Acme Corporation"}
    ]} />
  </:breadcrumbs>
  
  <:actions>
    <.button_widget label="Edit" variant="ghost" size="sm" />
    <.button_widget label="New Case" variant="primary" size="sm" />
  </:actions>
  
  <:main_content>
    <.card_widget class="mb-4">
      <.container_widget display="flex" direction="col" gap="4">
        <.text_widget size="lg" weight="semibold">Contact Information</.text_widget>
        <.divider_widget />
        <.container_widget display="grid" class="grid-cols-2 gap-4">
          <.text_widget>
            <.text_widget weight="medium">Primary Contact:</.text_widget>
            John Smith
          </.text_widget>
          <.text_widget>
            <.text_widget weight="medium">Email:</.text_widget>
            john@acme.com
          </.text_widget>
        </.container_widget>
      </.container_widget>
    </.card_widget>
  </:main_content>
  
  <:sidebar>
    <.card_widget>
      <.text_widget size="lg" weight="semibold" class="mb-4">Quick Stats</.text_widget>
      <.container_widget display="flex" direction="col" gap="3">
        <.stat_widget label="Active Cases" value="3" size="sm" />
        <.stat_widget label="Total Billed" value="$125,000" size="sm" />
        <.stat_widget label="Client Since" value="2019" size="sm" />
      </.container_widget>
    </.card_widget>
  </:sidebar>
</.detail_page>
```

---

## 8. DEVELOPER GUIDELINES

### 8.1 When to Create New Layout Patterns

Create a new layout pattern when:
- You have a recurring page structure
- The pattern appears 3+ times
- It enforces consistent spacing/alignment
- It simplifies widget placement

### 8.2 Layout Best Practices

1. **Start with standard patterns** - Use existing layouts first
2. **Embrace empty space** - Don't fill every column
3. **Think in rows** - Group related widgets horizontally
4. **Use consistent spacing** - Stick to LEGO units
5. **Test responsiveness** - Check all breakpoints

### 8.3 Performance Considerations

- **Lazy load heavy content** - Use Phoenix LiveView's async features
- **Minimize nested containers** - Keep DOM structure flat
- **Use CSS Grid efficiently** - Let the browser handle layout
- **Avoid layout thrashing** - Batch widget updates

### 8.4 Common Anti-Patterns to Avoid

❌ **Don't**: Try to fill every grid column
✅ **Do**: Use empty space purposefully

❌ **Don't**: Create deeply nested layouts
✅ **Do**: Keep structure flat and simple

❌ **Don't**: Mix layout systems
✅ **Do**: Use only the LEGO grid

❌ **Don't**: Hard-code responsive behavior
✅ **Do**: Use the built-in responsive grid

---

## 9. MIGRATION FROM PHASE 2

### 9.1 Converting Existing Pages

**Before (Direct widget placement):**
```heex
<div>
  <h1>Dashboard</h1>
  <.card_widget>...</.card_widget>
  <.card_widget>...</.card_widget>
</div>
```

**After (Using layout patterns):**
```heex
<.metrics_dashboard title="Dashboard">
  <:metrics>
    <.card_widget size="3x1">...</.card_widget>
    <.card_widget size="3x1">...</.card_widget>
  </:metrics>
</.metrics_dashboard>
```

### 9.2 Refactoring Checklist

- [ ] Identify the page type (list, detail, dashboard, etc.)
- [ ] Choose appropriate layout pattern
- [ ] Move widgets into proper slots
- [ ] Add empty space for visual balance
- [ ] Test responsive behavior
- [ ] Remove any custom CSS

---

## 10. TESTING LAYOUTS

### 10.1 Visual Testing

Create a layout gallery page:

```elixir
defmodule DemostarterWeb.LayoutGalleryLive do
  use DemostarterWeb, :live_view
  
  def render(assigns) do
    ~H"""
    <.container_widget>
      <.text_widget size="2xl" weight="bold" class="mb-8">
        Layout Pattern Gallery
      </.text_widget>
      
      <!-- Show each layout pattern with example content -->
      <.container_widget display="flex" direction="col" gap="8">
        <div>
          <.text_widget size="lg" weight="semibold" class="mb-4">
            Metrics Dashboard
          </.text_widget>
          <.metrics_dashboard title="Example Dashboard">
            <!-- Example content -->
          </.metrics_dashboard>
        </div>
        
        <!-- Repeat for other patterns -->
      </.container_widget>
    </.container_widget>
    """
  end
end
```

### 10.2 Responsive Testing

Test layouts at key breakpoints:
- 375px (iPhone SE)
- 768px (iPad)
- 1024px (Desktop)
- 1440px (Large Desktop)

---

## 11. VERIFICATION CHECKLIST

Before completing Phase 3:

- [ ] **Layout Patterns Implemented**
  - [ ] Dashboard layouts (metrics, admin, analytics)
  - [ ] Page templates (list, detail, form, settings)
  - [ ] All use widget-only composition

- [ ] **Responsive Behavior**
  - [ ] Grid collapses correctly on mobile
  - [ ] Tablet layout works properly
  - [ ] Desktop uses full 12 columns
  - [ ] Container queries function

- [ ] **Empty Space Usage**
  - [ ] Layouts use empty columns effectively
  - [ ] Visual balance maintained
  - [ ] No cramped interfaces

- [ ] **Slot Composition**
  - [ ] Named slots work correctly
  - [ ] Optional slots handled
  - [ ] Conditional rendering works

- [ ] **Documentation**
  - [ ] Each layout pattern documented
  - [ ] Usage examples provided
  - [ ] Migration guide complete

- [ ] **Testing**
  - [ ] Layout gallery page created
  - [ ] All breakpoints tested
  - [ ] Real-world examples work

---

## 12. COMMON ISSUES AND SOLUTIONS

### Issue: Layout breaks on tablet
**Solution:** Use responsive column classes:
```heex
<div class="col-span-12 md:col-span-6 lg:col-span-4">
```

### Issue: Content feels cramped
**Solution:** Add empty columns or spacer rows:
```heex
<div class="col-span-2"></div> <!-- Empty space -->
<div class="col-span-12 h-8"></div> <!-- Spacer row -->
```

### Issue: Sidebar pushes content off screen
**Solution:** Use responsive grid adjustments:
```heex
<main class="col-span-12 lg:col-span-8">
<aside class="col-span-12 lg:col-span-4">
```

---

## 13. NEXT STEPS

After Phase 3 is complete:

1. **Phase 4**: Validation layer enhancements
2. **Phase 5**: Interactive features and real-time updates
3. **Phase 6**: Complete documentation and Storybook

---

This completes the Phase 3 implementation plan for the Layout System in the LEGO UI system.