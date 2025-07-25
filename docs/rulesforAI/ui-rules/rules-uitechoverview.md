# UI Architecture Overview

## Component Building Block System

This project uses a **LEGO brick approach** where standardized components serve as building blocks for complete UI features and pages.

**Visual Reference:** `/ui-components` - Live showcase of all available components

## Component Usage Hierarchy

1. **DaisyUI Components** - Primary building blocks for most UI elements (buttons, cards, navbars, etc.)
2. **Phoenix LiveView Components** - Functional components for forms, data display, state management
3. **Ash Authentication Phoenix Components** - Specialized components for authentication pages only

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

The tech stack directly supports the component building block approach:

- **Tailwind + DaisyUI** - Provides the majority of UI building blocks
- **Phoenix LiveView** - Enables functional components with proper state management
- **HEEx Templates** - Support both Phoenix component syntax (`<.component>`) and DaisyUI HTML
- **Natural Styling** - app.css + root.html.heex handle all visual appearance automatically

## Build Configuration

- **Tailwind Input**: `assets/css/app.css`
- **Tailwind Output**: `priv/static/assets/css/app.css`
- **JavaScript Entry**: `assets/js/app.js`
- **JavaScript Output**: `priv/static/assets/js/`

## Related Documentation

- `rules-uiavailablecomponents.md` - Complete catalog of building block components
- `rules-overalluirules.md` - Rules for composing components into complete UI features  
- **Live Reference:** `/ui-components` - Visual showcase of all components in action