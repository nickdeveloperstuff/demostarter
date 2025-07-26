# Shadow System Rules

## Core Principle
All shadows are defined as CSS variables in app.css and applied through utility classes. This is THE shadow system - use it consistently.

## Shadow Scale
Use semantic shadow utilities:
- `shadow-2xs` - Barely visible (0.05 opacity)
- `shadow-xs` - Very subtle
- `shadow-sm` - Small shadow
- `shadow` - Default shadow
- `shadow-md` - Medium shadow
- `shadow-lg` - Large shadow
- `shadow-xl` - Extra large shadow
- `shadow-2xl` - Maximum shadow

## Usage Guidelines
- Cards: `shadow` default, `shadow-lg` on hover
- Modals: `shadow-xl` or `shadow-2xl`
- Buttons: `shadow-sm` default
- Dropdowns: `shadow-lg`
- Inputs: No shadow default, `shadow` on focus

## Implementation
```heex
<!-- Card with hover enhancement -->
<div class="card shadow hover:shadow-lg transition-shadow">
  <!-- Content -->
</div>

<!-- Modal with prominent shadow -->
<div class="modal-box shadow-xl">
  <!-- Modal content -->
</div>

<!-- Button with subtle shadow -->
<button class="btn shadow-sm">
  Click me
</button>

<!-- Dropdown with clear separation -->
<div class="dropdown dropdown-open">
  <div class="dropdown-content shadow-lg">
    <!-- Dropdown items -->
  </div>
</div>
```

## Shadow + Animation Pattern
Combine shadows with transitions for polished interactions:
```heex
<!-- Card that lifts on hover -->
<div class="card shadow transition-all hover-lift hover-shadow-lg">
  <div class="card-body">
    <h2 class="card-title">Interactive Card</h2>
    <p>Hover to see shadow enhancement</p>
  </div>
</div>

<!-- Input with focus shadow -->
<input class="input input-bordered transition-shadow focus:shadow" />
```

## Visual Hierarchy
Use shadows to create depth and separation:
- Background elements: `shadow-xs` or no shadow
- Content cards: `shadow` or `shadow-sm`
- Active/hover states: `shadow-lg`
- Modals/popovers: `shadow-xl` or `shadow-2xl`

## DaisyUI Integration
Shadows enhance DaisyUI components without replacing their styles:
```heex
<!-- Enhanced DaisyUI components -->
<div class="navbar shadow-sm">
  <!-- Navbar content -->
</div>

<div class="drawer-side shadow-xl">
  <!-- Drawer content -->
</div>

<div class="toast shadow-lg">
  <div class="alert">
    <!-- Toast message -->
  </div>
</div>
```

## NEVER
- Use inline box-shadow styles
- Create custom shadow values
- Skip shadows on elevated elements
- Use shadows that don't match the scale

## Shadow Philosophy
- Shadows indicate elevation and hierarchy
- Consistent shadows create visual cohesion
- Subtle shadows look more professional
- Interactive elements should respond with shadow changes

## Complete Example
```heex
<!-- Dashboard card with full enhancement -->
<div class="card bg-base-100 shadow transition-all hover-lift hover-shadow-lg">
  <div class="card-body">
    <h2 class="card-title text-xl">Revenue</h2>
    <div class="stat">
      <div class="stat-value">$12,345</div>
      <div class="stat-desc text-sm">↗︎ 12% increase</div>
    </div>
    <div class="card-actions">
      <button class="btn btn-primary btn-sm shadow-sm transition-all hover-scale">
        View Details
      </button>
    </div>
  </div>
</div>
```