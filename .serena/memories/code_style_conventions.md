# Code Style and Conventions

## Elixir Code Style
- Uses standard Elixir formatting via `mix format`
- Configured in `.formatter.exs` with Ash-specific formatting rules
- Snake_case for variables and function names
- PascalCase for module names
- Uses `@moduledoc` and `@doc` for documentation

## Phoenix/LiveView Conventions
- Components defined in `DemostarterWeb.CoreComponents`
- Uses HEEx templates (.html.heex files)
- Component attributes defined with `attr` macro
- Slots defined with `slot` macro
- Function components start with `def component_name(assigns)`

## CSS/Styling Conventions
- Tailwind CSS utility classes for styling
- DaisyUI component classes (btn, card, modal, etc.)
- Custom CSS custom properties for theming
- Dark/light theme support via data attributes

## Directory Structure
- `lib/demostarter/` - Business logic and Ash resources
- `lib/demostarter_web/` - Web interface (controllers, components, templates)
- `lib/demostarter_web/components/` - Reusable UI components
- `assets/` - Frontend assets (CSS, JS, images)
- `config/` - Application configuration
- `priv/` - Static assets and database files

## Ash Framework Conventions
- Resources defined with `use Ash.Resource`
- Actions, attributes, relationships defined declaratively
- Domains (formerly APIs) group related resources
- Authentication tokens and user management built-in