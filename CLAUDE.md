# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Demostarter is a Phoenix/Elixir web application starter template built with the Ash framework. It provides authentication, admin capabilities, and a modern UI foundation using Phoenix LiveView, Tailwind CSS, and DaisyUI.

## Essential Commands

### Setup and Development
```bash
mix setup              # Install dependencies, setup database, build assets
mix phx.server          # Start Phoenix server
iex -S mix phx.server   # Start with interactive Elixir shell
```

### Database Management
```bash
mix ash.setup           # Setup Ash resources and database (preferred)
mix ecto.create         # Create database
mix ecto.migrate        # Run migrations
mix ecto.reset          # Drop and recreate database
```

### Asset Management
```bash
mix assets.setup        # Install Tailwind and esbuild
mix assets.build        # Build CSS and JS assets
mix assets.deploy       # Build and minify for production
```

### Testing and Code Quality
```bash
mix test               # Run tests (sets up Ash resources first)
mix format             # Format Elixir code
mix compile --warnings-as-errors  # Check for compilation warnings
```

## Architecture Overview

### Tech Stack
- **Backend**: Elixir with Phoenix Framework
- **Database**: PostgreSQL via Ash Postgres adapter
- **Authentication**: Ash Authentication with Phoenix integration
- **Admin Interface**: Ash Admin
- **Frontend**: Phoenix LiveView with server-side rendering
- **Styling**: Tailwind CSS with DaisyUI plugin
- **Icons**: Heroicons
- **Build Tools**: esbuild (JavaScript), Tailwind (CSS)

### Key Directory Structure
```
lib/
├── demostarter/           # Business logic and Ash resources
│   ├── accounts/          # User management and authentication
│   └── application.ex     # OTP application
├── demostarter_web/       # Web interface
│   ├── components/        # Reusable UI components
│   ├── controllers/       # HTTP controllers
│   ├── live/             # LiveView modules
│   └── router.ex         # Route definitions
config/                   # Application configuration
assets/                   # Frontend assets (CSS, JS, images)
priv/                     # Static assets and database files
docs/rulesforAI/          # AI development guidelines
```

### Ash Framework Integration
- **Resources**: Defined with `use Ash.Resource` (User, Token models)
- **Domains**: Group related resources (Accounts domain)
- **Actions**: Declarative CRUD and custom actions
- **Authentication**: Built-in token management and user flows
- **Admin**: Auto-generated admin interface at `/admin`

## Development Guidelines

### Code Style
- Uses standard Elixir formatting via `mix format`
- Configured in `.formatter.exs` with Ash-specific formatting rules
- Snake_case for variables and functions, PascalCase for modules
- Document public functions with `@doc` and modules with `@moduledoc`

### UI Development Rules
- **ONLY** use components defined in `docs/rulesforAI/rules-uicomponents.md`
- Use Tailwind utilities exclusively for spacing and layout
- Follow the project's spacing scale (0.25rem base unit)
- Keep UI "dumb" - no business logic in UI code
- Never modify `app.css` or component styling classes
- Preserve existing layouts and minimize changes

### Testing Strategy
- Run `mix test` to execute the test suite
- Tests automatically set up Ash resources before running
- Add tests for new Ash resources and actions
- Test authentication flows when modifying auth-related code

## Task Completion Checklist

When completing development tasks:

1. **Code Quality**
   - Run `mix format` to format code
   - Ensure no compilation warnings with `mix compile --warnings-as-errors`
   - Verify tests pass with `mix test`

2. **Database Changes**
   - Run `mix ash.setup` if Ash resources were modified
   - Test migrations work correctly

3. **Assets and Build**
   - Rebuild assets with `mix assets.build` if CSS/JS changed
   - Verify application starts with `mix phx.server` -- HOWEVER, the server is almost always already ON and has already been started by the user. It starts at localhost:4000 as is normal.
   - Test in browser at `localhost:4000`

4. **Final Verification**
   - Clean restart: `mix deps.clean --all && mix setup`
   - Full test suite: `mix test`
   - Manual testing of affected features

## Key Files and Patterns

### Authentication
- `lib/demostarter/accounts/user.ex` - User resource with Ash Authentication
- `lib/demostarter_web/auth_controller.ex` - Authentication endpoints
- `lib/demostarter_web/live_user_auth.ex` - LiveView authentication helpers

### UI Components
- `lib/demostarter_web/components/core_components.ex` - Reusable UI components
- `lib/demostarter_web/components/layouts.ex` - Layout templates
- Uses HEEx templates with `attr` and `slot` macros for component definitions

### Configuration
- `config/config.exs` - Base configuration
- `config/dev.exs` - Development environment
- `config/prod.exs` - Production environment
- Mix aliases in `mix.exs` define common task shortcuts