# Design System Reference

## Core Philosophy
- **Grid Foundation**: Every page inherits the 8px grid system automatically
- **One Control Center**: app.css defines EVERYTHING
- **LEGO Bricks**: DaisyUI components + design system enhancements
- **Utility Classes Only**: No custom CSS ever
- **Visual Consistency**: Through CSS variables

## CSS Variables
Access all design tokens via CSS variables:
- Colors: `var(--color-primary)`
- Spacing: `var(--spacing-lg)` or `var(--spacing-4)`
- Fonts: `var(--font-sans)`
- Shadows: `var(--shadow-lg)`

## Color Philosophy
Follow 60-30-10 rule:
- 60% Background (base-100)
- 30% Surface (base-200, cards)
- 10% Accents (primary, buttons)

## Component Enhancement Pattern
1. Start with DaisyUI component
2. Add transition utilities
3. Add hover states
4. Add focus states
5. Apply typography classes
6. Apply shadow utilities

Example:
```heex
<!-- Base DaisyUI component -->
<button class="btn btn-primary">Click me</button>

<!-- Fully enhanced with design system utilities -->
<button class="btn btn-primary transition-all hover-scale focus-ring shadow-sm">
  Click me
</button>
```

## Design Tokens Quick Reference

### Spacing (both conventions work)
```
Base unit: 8px (0.5rem) - inherited from grid system
Numeric: 0, 0.5, 1, 1.5, 2, 3, 4, 6, 8, 12, 16
Semantic: xs, sm, md, lg, xl, 2xl, 3xl
```

### Typography
```
Sizes: text-xs, text-sm, text-base, text-lg, text-xl, text-2xl, text-3xl, text-4xl
Fonts: font-sans, font-mono, font-serif
```

### Shadows
```
Levels: shadow-2xs, shadow-xs, shadow-sm, shadow, shadow-md, shadow-lg, shadow-xl, shadow-2xl
```

### Transitions
```
Classes: transition-all, transition-colors, transition-transform, transition-shadow
Timing: Always 0.2s ease
```

### Animations
```
Classes: animate-pulse, animate-spin, animate-slide-in-right, animate-slide-in-up
```

## Complete Component Example
```heex
<div class="card bg-base-100 shadow transition-all hover-lift hover-shadow-lg">
  <figure>
    <img src="/api/placeholder/400/200" alt="Card image" />
  </figure>
  <div class="card-body">
    <h2 class="card-title text-2xl font-sans">
      Card Title
      <div class="badge badge-secondary shadow-xs">NEW</div>
    </h2>
    <p class="text-base text-muted-foreground">
      Card description with proper typography and color.
    </p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary transition-all hover-scale focus-ring shadow-sm">
        Buy Now
      </button>
    </div>
  </div>
</div>
```

## Color Usage Patterns
```heex
<!-- Primary actions -->
<button class="btn btn-primary">Primary Action</button>

<!-- Secondary elements -->
<div class="bg-base-200 p-4">Secondary surface</div>

<!-- Muted text -->
<p class="text-muted-foreground">Supporting text</p>

<!-- Borders -->
<div class="border border-base-300">Bordered content</div>

<!-- Interactive states -->
<input class="input input-bordered focus:border-primary" />
```

## Responsive Patterns
Mobile adjustments happen automatically through Tailwind:
```heex
<!-- Responsive spacing -->
<div class="p-4 md:p-6 lg:p-8">
  <!-- Content -->
</div>

<!-- Responsive text -->
<h1 class="text-2xl md:text-3xl lg:text-4xl">
  Responsive Heading
</h1>
```

## NEVER
- Access design tokens outside of utility classes
- Create new CSS variables outside app.css
- Use inline styles
- Mix numeric and semantic spacing in same component

## Quick Decision Guide
1. **Need a component?** → Start with DaisyUI
2. **Need motion?** → Add transition-* classes
3. **Need depth?** → Add shadow-* classes
4. **Need specific font?** → Use font-* classes
5. **Need spacing?** → Use p-*, m-*, gap-* with our scale
6. **Need color?** → Use DaisyUI color classes

## Remember
Everything visual is controlled in ONE place: app.css. This makes updates easy and maintains consistency across the entire application.