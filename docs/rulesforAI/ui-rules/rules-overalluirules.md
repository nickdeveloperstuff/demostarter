# UI Build Rules

## Purpose / Scope
Rules for building **complete UI features and pages** using standardized component building blocks. Keep the UI layer "dumb," preserve global styling, and create functional mockups within existing pages.

### Use this file when...
- Building new UI features, pages, or complete functional mockups
- Combining components into cohesive UI experiences
- Creating UI mockups within existing pages/routes
- You need spacing, layout, or component composition guidance

### Cross-References:
- `rules-uiavailablecomponents.md` – Complete catalog of available building blocks
- `rules-uitechoverview.md` – Technical architecture and component hierarchy
- **Visual Reference:** `/ui-components` – See all components in action

## Must / Should / May

### MUST
- **ONLY** use components from `rules-uiavailablecomponents.md` - these are your LEGO bricks
- **Use standard component syntax** - Phoenix `<.component>` syntax, DaisyUI standard HTML+CSS
- **Validate visually** using `/ui-components` before building - this is your reference
- **Natural styling inheritance** - let app.css and root.html.heex handle all styling
- **Zero business logic** - keep all UI implementations purely visual
- **Use dummy data patterns** - consistent sample data ("John Doe", "Sample Text", etc.)
- **Follow component hierarchy** - DaisyUI ONLY → Icons via Phoenix `<.icon>` → Ash auth only
- **Use Tailwind spacing only** - follow the spacing scale below

### SHOULD
- **Build complete functional UI mockups** - not just individual components
- **Combine components thoughtfully** - layout → navigation → data → interactions → feedback
- Split large UI features into reviewable increments

### MAY
- Use Tailwind utilities for layout (grid, flex, spacing) within the approved scale
- Create complete page mockups within existing routes

### NEVER
- Modify `app.css`, `root.html.heex`, or any component styling classes
- Add custom styling or business logic to UI mockups
- Create new component types or import external component libraries
- Skip visual validation via `/ui-components` showcase

## UI Building Methodology

### 1. Visual Validation First
- **Always check `/ui-components`** before starting any UI work
- Use this as your visual reference for component appearance and behavior
- Ensure you understand each component's standard implementation

### 2. Component Composition Strategy
Build UI features by combining components in this order:

1. **Layout Foundation** - Use DaisyUI cards, heroes, dividers for structure
2. **Navigation Elements** - Add DaisyUI menus, breadcrumbs, tabs for navigation
3. **Data Display** - Use DaisyUI stats, tables, and lists for content
4. **Interactive Elements** - Add DaisyUI buttons, modals, forms for actions
5. **Feedback Systems** - Use DaisyUI alerts and toasts for responses
6. **Icons** - Use Phoenix `<.icon name="hero-*">` component for all icons

### 3. Implementation Standards
- **DaisyUI Components (PRIMARY):** `<element class="daisy-class other-classes">content</element>`
- **Icons (ONLY EXCEPTION):** `<.icon name="hero-*" class="size-class" />`
- **Phoenix Components:** Use ONLY when explicitly directed by user
- **Natural Inheritance:** No custom styles - let existing CSS handle appearance
- **Dummy Data:** Use consistent patterns (see component docs)

### 4. Icon Usage Standards

**ONLY use the Phoenix `<.icon>` component for icons** - this is the single exception to the DaisyUI-only rule.

#### Icon Syntax
```heex
<!-- Basic icon -->
<.icon name="hero-bell" class="h-6 w-6" />

<!-- Different sizes -->
<.icon name="hero-users" class="size-4" />
<.icon name="hero-chart-bar" class="size-8" />

<!-- With additional classes -->
<.icon name="hero-check-circle" class="shrink-0 h-6 w-6" />
```

#### Available Icon Variants
- **Outline (default):** `hero-bell`
- **Solid:** `hero-bell-solid`
- **Mini:** `hero-bell-mini`
- **Micro:** `hero-bell-micro`

#### Common Icon Names
- `hero-bell` - Notifications
- `hero-users` - User/people
- `hero-chart-bar` - Analytics/stats
- `hero-currency-dollar` - Money/revenue
- `hero-information-circle` - Info alerts
- `hero-check-circle` - Success states
- `hero-exclamation-triangle` - Warnings
- `hero-document-text` - Documents/reports

#### Icon Integration in DaisyUI Components
```heex
<!-- In buttons -->
<button class="btn btn-primary">
  <.icon name="hero-plus" class="h-5 w-5" />
  Add User
</button>

<!-- In alerts -->
<div class="alert alert-info">
  <.icon name="hero-information-circle" class="shrink-0 w-6 h-6" />
  <span>Information message</span>
</div>

<!-- In stats -->
<div class="stat">
  <div class="stat-figure text-primary">
    <.icon name="hero-users" class="inline-block w-8 h-8" />
  </div>
  <div class="stat-title">Total Users</div>
  <div class="stat-value">1,234</div>
</div>
```

### 5. Quality Checklist
- [ ] Used only DaisyUI components (except icons)
- [ ] Used `<.icon>` component for all icons with proper `hero-*` naming
- [ ] Followed standard component syntax exactly
- [ ] Applied natural styling inheritance (no custom styles)
- [ ] Used consistent dummy data patterns
- [ ] Built complete functional mockup (not just individual components)
- [ ] Validated appearance against `/ui-components` reference

---

# Spacing Guidelines

**ONLY USE TAILWIND FOR SPACING!**

## Base Unit (u)
**0.25rem (4px)**. Do not change this.

## Allowed Scale (multipliers of u)
`0` `0.5` `1` `1.5` `2` `3` `4` `6` `8` `12` `16`

## Tailwind Spacing Tokens

| Token | Value |
|-------|-------|
| 0 | 0 |
| 0.5 | 0.125rem (2px) |
| 1 | 0.25rem (4px) |
| 1.5 | 0.375rem (6px) |
| 2 | 0.5rem (8px) |
| 3 | 0.75rem (12px) |
| 4 | 1rem (16px) |
| 6 | 1.5rem (24px) |
| 8 | 2rem (32px) |
| 12 | 3rem (48px) |
| 16 | 4rem (64px) |

Use Tailwind padding/margin/gap utilities with these keys only (`p-1`, `px-2`, `gap-3`, `mt-6`, `space-y-8`, etc.). Disable or ignore everything else.

## What Each Spacing Step is For (Desktop Defaults)

| Step | Use Case |
|------|----------|
| **0.5u** | Very tight inner padding (icons inside a button) |
| **1u** | Label-to-input gap, icon-to-text gap |
| **1–1.5u** | Small gaps inside a component (stacked form rows, list items inside a card) |
| **2–3u** | Component internal padding (card body padding, modal content padding) |
| **3–4u** | Gap between sibling components (cards next to each other, stacked modules) |
| **6–8u** | Gap between major page sections or rows |
| **12–16u** | Page gutters and margins from viewport edges |

## Mobile Adjustment Rule
When under your first breakpoint, move each chosen desktop value down exactly one step (do not go below 1u).

**Example:** desktop section gap = 6u → mobile section gap = 4u

## Enforcement Rules

1. **Only use values on the scale.** No custom numbers.
2. **Respect the hierarchy:** inside-element spacing < between components < between sections < page edges
3. **Do not jump more than two steps** unless you have a clear, documented reason.
4. **If unsure,** choose the next larger step rather than inventing a fraction.
5. **Keep vertical rhythm:** spacing should align with typography (line-height should also be a multiple of u).
6. **For denser layouts** (mobile or data-heavy tables), reduce by one step instead of adding new sizes.

## Formula
`space = u × scale_value`

**Example:** `gap-4` means gap = 1rem (4u × 0.25rem)