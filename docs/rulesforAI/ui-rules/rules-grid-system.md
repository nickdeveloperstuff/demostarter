# Grid System Rules

## Purpose / Scope
Rules for implementing a **square-based modular grid system** that enforces consistent spacing and alignment across all Phoenix LiveView pages. This system ensures visual harmony and makes it difficult for developers or AI to break layout consistency.

### Use this file when...
- Building any new page or UI feature
- Placing elements on a page
- Aligning icons, text, or components
- Creating responsive layouts
- Debugging spacing issues

### Cross-References:
- `rules-overalluirules.md` – Overall UI building guidelines
- `rules-design-system.md` – Design tokens and styling
- `app.css` – Grid system implementation
- `core_components.ex` – Phoenix component helpers

## Grid System Overview

### Base Unit
**8px (0.5rem)** - All spacing and sizing must be multiples of this unit.

### Grid Structure
- **Mobile**: 4 columns
- **Tablet**: 8 columns (640px+)
- **Desktop**: 12 columns (1024px+)
- **Gutter**: 8px (var(--grid-gap))

### 🚨 CRITICAL: Automatic Grid Inheritance 🚨
**EVERY PAGE AUTOMATICALLY INHERITS THE GRID SYSTEM!**

How it works:
1. `root.html.heex` wraps ALL content in `.app-grid-wrapper`
2. This provides base padding and grid context to EVERY page
3. **You get the grid system FOR FREE - no setup needed!**
4. **It is IMPOSSIBLE to create a page without the grid**

⚠️ **WARNING**: The grid wrapper in `root.html.heex` is the foundation of the entire design system. NEVER modify or remove it!

## MUST / SHOULD / NEVER

### MUST
- **Use grid classes** for all layouts (`.grid-page`, `.grid-auto`, `.grid-squares`)
- **Use column spans** that respect the grid (`.col-span-*`, `.grid-cell-*`)
- **Align icons** using `.icon-cell` or `.icon-label` components
- **Use gap utilities** for spacing between elements (`.gap-2`, `.gap-4`, etc.)
- **Size icons** to grid units (16px, 20px, 24px, 32px, 48px)
- **Center content** using `.center-content`, `.center-vertical`, `.center-horizontal`

### SHOULD
- Use Phoenix component helpers (`<.grid_page>`, `<.grid_section>`, `<.grid_cell>`)
- Test layouts at all breakpoints
- Use `.grid-debug` class during development to visualize the grid

### NEVER
- **Modify the `.app-grid-wrapper` in `root.html.heex`** - This breaks EVERYTHING
- **Use absolute positioning to escape the grid** - The grid is mandatory
- **Apply negative margins that break grid alignment** - Respect the grid boundaries
- Use arbitrary pixel values (e.g., `ml-[7px]`, `w-[37px]`)
- Skip the grid system for "quick fixes"
- Mix grid and non-grid spacing in the same component
- Try to "opt out" of the grid system - it's impossible and will break the design

## Grid Implementation Patterns

### 1. Page Layout Structure

```heex
<.grid_page>
  <!-- Full width header -->
  <header class="col-span-full">
    <h1>Page Title</h1>
  </header>
  
  <!-- Two column layout on desktop -->
  <.grid_cell span="two-thirds">
    <div class="card">Main content</div>
  </.grid_cell>
  
  <.grid_cell span="third">
    <div class="card">Sidebar</div>
  </.grid_cell>
</grid_page>
```

### 2. Responsive Grid Patterns

```heex
<!-- Auto-responsive grid -->
<div class="grid-auto">
  <div class="card">Item 1</div>
  <div class="card">Item 2</div>
  <div class="card">Item 3</div>
  <div class="card">Item 4</div>
</div>

<!-- Square grid for galleries -->
<div class="grid-squares">
  <div class="center-content bg-base-200">
    <.icon name="hero-photo" class="icon-lg" />
  </div>
  <!-- More squares... -->
</div>
```

### 3. Icon Alignment Patterns

```heex
<!-- Centered icon in square -->
<.icon_cell>
  <.icon name="hero-home" class="icon-md" />
</.icon_cell>

<!-- Icon with label (vertical) -->
<.icon_label label="Dashboard">
  <:icon>
    <.icon name="hero-home" class="icon-md" />
  </:icon>
</.icon_label>

<!-- Icon with label (horizontal) -->
<.icon_label label="Settings" horizontal>
  <:icon>
    <.icon name="hero-cog-6-tooth" class="icon-sm" />
  </:icon>
</.icon_label>
```

### 4. Section Spacing

```heex
<.grid_section>
  <h2>Section Title</h2>
  <p>This section has consistent spacing above and below.</p>
</.grid_section>

<.grid_section>
  <h2>Next Section</h2>
  <p>Automatically spaced from the previous section.</p>
</.grid_section>
```

## Icon Sizing Reference

| Class | Size | Grid Units | Use Case |
|-------|------|------------|----------|
| `icon-xs` | 16px | 2 units | Inline with text |
| `icon-sm` | 20px | 2.5 units | Buttons, small UI |
| `icon-md` | 24px | 3 units | Standard icons |
| `icon-lg` | 32px | 4 units | Feature icons |
| `icon-xl` | 48px | 6 units | Hero sections |

## Spacing Quick Reference

| Class | Value | Use Case |
|-------|-------|----------|
| `gap-1` | 4px | Tight grouping |
| `gap-2` | 8px | Standard spacing |
| `gap-3` | 12px | Comfortable spacing |
| `gap-4` | 16px | Section spacing |
| `gap-6` | 24px | Large sections |
| `gap-8` | 32px | Major divisions |

## Common Patterns

### Card Grid
```heex
<div class="grid-page">
  <div class="col-span-12 sm:col-span-6 lg:col-span-4">
    <div class="card">Card 1</div>
  </div>
  <div class="col-span-12 sm:col-span-6 lg:col-span-4">
    <div class="card">Card 2</div>
  </div>
  <div class="col-span-12 sm:col-span-6 lg:col-span-4">
    <div class="card">Card 3</div>
  </div>
</div>
```

### Dashboard Layout
```heex
<.grid_page>
  <!-- Stats row -->
  <div class="col-span-full grid-auto">
    <div class="stat">
      <div class="stat-figure text-primary">
        <.icon name="hero-users" class="icon-lg" />
      </div>
      <div class="stat-title">Users</div>
      <div class="stat-value">1,234</div>
    </div>
    <!-- More stats... -->
  </div>
  
  <!-- Content area -->
  <div class="col-span-12 lg:col-span-8">
    <!-- Main content -->
  </div>
  
  <div class="col-span-12 lg:col-span-4">
    <!-- Sidebar -->
  </div>
</.grid_page>
```

## Debugging

### Enable Grid Visualization
Add `grid-debug` class to body to see the grid overlay:

```javascript
// In browser console
document.body.classList.add('grid-debug')
```

This shows:
- Red lines: 8px base grid
- Blue columns: Column boundaries

### Common Issues

1. **Content overflowing horizontally**
   - Check for fixed pixel widths
   - Ensure using `col-span-*` classes
   - Verify images have `max-width: 100%`

2. **Uneven spacing**
   - Use gap utilities, not margins
   - Check for mixed spacing units
   - Ensure consistent use of grid classes

3. **Icons not centered**
   - Use `.icon-cell` wrapper
   - Apply `.center-content` to parent
   - Check icon size class is applied

## Integration with Existing UI Rules

The grid system works seamlessly with:
- **DaisyUI components**: All components respect grid alignment
- **Tailwind spacing**: Grid units match Tailwind's spacing scale
- **Design system animations**: Transitions work within grid cells
- **Typography**: Line heights align to grid rhythm

## Summary

The grid system ensures:
1. **Consistent spacing** - Everything aligns to 8px grid
2. **Responsive behavior** - Automatic column adjustments
3. **Icon alignment** - Perfect centering every time
4. **Developer friendly** - Hard to break, easy to use
5. **AI friendly** - Clear rules prevent layout mistakes

Always start with the grid, then add components within it.