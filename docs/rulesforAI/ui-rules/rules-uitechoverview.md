# UI Architecture Overview

## Component Building Block System

This project uses a **LEGO brick approach** where standardized components serve as building blocks for complete UI features and pages.

**Visual Reference:** `/ui-components` - Live showcase of all available components

## Component Usage Hierarchy

1. **DaisyUI Components** - DEFAULT choice for ALL UI elements (buttons, cards, navbars, forms, tables, etc.)
2. **Icons** - Use Phoenix `<.icon>` component ONLY for icons with `hero-*` naming  
3. **Ash Authentication Phoenix Components** - Specialized components for authentication pages only
4. **Phoenix LiveView Components** - Use ONLY when explicitly directed by user

### Implementation Philosophy
- **Standard Syntax Only** - Use components exactly as documented
- **Natural Inheritance** - Let app.css and root.html.heex handle all styling  
- **Zero Business Logic** - Keep UI implementations purely visual
- **Complete Features** - Build full functional mockups, not just individual components

## Critical Files - DO NOT MODIFY

**root.html.heex** (`lib/demostarter_web/components/layouts/root.html.heex`) - DO NOT TOUCH THIS FILE. Contains the base HTML structure and theme switching logic.

## Styling Control

All UI styling changes are controlled through **app.css** (`assets/css/app.css`). The combination of root.html.heex + app.css controls every single UI styling change in the application. DO NOT MODIFY THIS FILE UNLESS PROMPTED TO EDIT THIS FILE BY NAME. 

## Technology Stack & Versions

- **Tailwind CSS**: v4.1.7 (using new CSS-based configuration)
- **DaisyUI**: Latest (integrated via Tailwind plugin)
- **Phoenix LiveView**: v1.1.0-rc.0
- **Phoenix**: v1.8.0-rc.4
- **ESBuild**: v0.25.4
- **Heroicons**: v2.2.0

## Spacing & Layout Philosophy

The per-component spacing approach supports the LEGO brick methodology:

- **Per-Component Spacing** - Each component/feature handles its own spacing using Tailwind utilities
- **Approved Spacing Scale** - Only use the standardized spacing scale (see `rules-overalluirules.md`)
- **Natural Layout Flow** - Let components inherit their natural layout behavior
- **No Custom CSS** - All spacing achieved through Tailwind utility classes only

This approach enables flexible component composition while maintaining consistent spacing throughout the application.

## Integration with UI Building

The tech stack directly supports the DaisyUI-first component building block approach:

- **Tailwind + DaisyUI** - Provides ALL primary UI building blocks (buttons, forms, tables, etc.)
- **Heroicons Integration** - CSS-based icon system through Phoenix `<.icon>` component
- **HEEx Templates** - Support both DaisyUI HTML and Phoenix icon syntax
- **Phoenix LiveView** - Used ONLY when explicitly directed by user
- **Natural Styling** - app.css + root.html.heex handle all visual appearance automatically

## Icon Integration System

The project uses a sophisticated Heroicons integration that converts SVG files into CSS classes:

### How It Works
1. **Installation**: Heroicons installed as git dependency at `deps/heroicons/optimized/`
2. **Plugin**: `assets/vendor/heroicons.js` Tailwind plugin reads SVG files
3. **CSS Generation**: SVGs converted to CSS classes with `data:image/svg+xml` URLs
4. **Rendering**: Phoenix `<.icon>` component renders as `<span class="hero-name size-class" />`
5. **Display**: CSS mask properties display the icon using currentColor

### Technical Implementation
```css
/* Generated CSS example */
.hero-bell {
  --hero-bell: url('data:image/svg+xml;utf8,%3Csvg...%3E');
  -webkit-mask: var(--hero-bell);
  mask: var(--hero-bell);
  mask-repeat: no-repeat;
  background-color: currentColor;
  display: inline-block;
  width: 1.5rem;
  height: 1.5rem;
}
```

### Usage in Templates
```heex
<!-- Phoenix component renders CSS class -->
<.icon name="hero-bell" class="h-6 w-6" />
<!-- Becomes: <span class="hero-bell h-6 w-6"></span> -->
```

## Build Configuration

- **Tailwind Input**: `assets/css/app.css`
- **Tailwind Output**: `priv/static/assets/css/app.css`
- **JavaScript Entry**: `assets/js/app.js`
- **JavaScript Output**: `priv/static/assets/js/`
- **Heroicons Plugin**: `assets/vendor/heroicons.js`

## Related Documentation

- `rules-uiavailablecomponents.md` - Complete catalog of building block components
- `rules-overalluirules.md` - Rules for composing components into complete UI features  
- **Live Reference:** `/ui-components` - Visual showcase of all components in action