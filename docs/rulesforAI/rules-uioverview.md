# UI Architecture Overview

## Component Usage Hierarchy

**DaisyUI Components** - Used for the majority of UI elements (buttons, cards, navbars, etc.)
**Phoenix LiveView Components** - Used for functional components requiring business logic (forms, modals, error messages, navigation links)
**Ash Authentication Phoenix Components** - Used specifically for authentication UI pages

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

## Spacing & Layout

Tailwind utility classes are used for spacing and layout on a **per-component basis**. There is no centralized spacing/layout control - each component and page handles its own spacing ad-hoc using Tailwind classes like `p-4`, `mt-8`, `gap-2`, etc.

## Build Configuration

- **Tailwind Input**: `assets/css/app.css`
- **Tailwind Output**: `priv/static/assets/css/app.css`
- **JavaScript Entry**: `assets/js/app.js`
- **JavaScript Output**: `priv/static/assets/js/`