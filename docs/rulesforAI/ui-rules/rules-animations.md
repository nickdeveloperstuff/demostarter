# Animation & Transition Rules

## Standard Timing
ALL transitions use: `0.2s ease`

This is THE standard. No exceptions. Defined once in app.css, used everywhere.

## Base Classes
- `transition-all` - Transition all properties
- `transition-colors` - Transition colors only
- `transition-transform` - Transition transform only
- `transition-shadow` - Transition shadows only

## Hover Patterns
- Cards: `transition-all hover-lift hover-shadow-lg`
- Buttons: `transition-all hover-scale`
- Links: `transition-colors`
- Inputs: `transition-all focus-ring`

## Animation Classes
- `animate-pulse` - Pulsing effect for loading
- `animate-spin` - Spinning effect for loaders
- `animate-slide-in-right` - Slide from right (0.35s)
- `animate-slide-in-up` - Slide from bottom (0.3s)

## Implementation
```heex
<!-- Enhanced DaisyUI card -->
<div class="card transition-all hover-lift hover-shadow-lg">
  <!-- Card content -->
</div>

<!-- Enhanced button -->
<button class="btn btn-primary transition-all hover-scale focus-ring">
  Click me
</button>

<!-- Loading spinner -->
<div class="loading loading-spinner animate-spin"></div>

<!-- Slide-in content -->
<div class="animate-slide-in-up">
  <p>Content that slides in from bottom</p>
</div>
```

## Focus States
All interactive elements MUST have visible focus states:
```heex
<input class="input input-bordered transition-all focus-ring" />
<button class="btn transition-all focus-ring">Accessible Button</button>
```

## Performance Guidelines
- Transitions are GPU-accelerated (transform, opacity)
- All timing defined in app.css for consistency
- No inline transition styles
- Keep animations subtle and professional

## DaisyUI Enhancement Pattern
1. Start with DaisyUI component
2. Add transition class
3. Add hover utility
4. Add focus utility

Example progression:
```heex
<!-- Base DaisyUI -->
<div class="card">

<!-- With transitions -->
<div class="card transition-all">

<!-- With hover -->
<div class="card transition-all hover-lift hover-shadow-lg">

<!-- Complete enhancement -->
<div class="card transition-all hover-lift hover-shadow-lg">
  <button class="btn btn-primary transition-all hover-scale focus-ring">
    Action
  </button>
</div>
```

## NEVER
- Use different timing than 0.2s ease
- Write custom keyframes (use provided ones)
- Add transitions via inline styles
- Skip focus states on interactive elements

## Animation Philosophy
- Subtle is better than dramatic
- Consistent timing creates cohesion
- Every interaction should feel responsive
- Accessibility through visible focus states