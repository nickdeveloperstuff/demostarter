# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Demostarter is a Phoenix/Elixir web application starter template built with the Ash framework. It provides authentication, admin capabilities, and a modern UI foundation using Phoenix LiveView, Tailwind CSS, and DaisyUI.

## Documentation Reference

The `docs/` folder contains background reference materials that are available but not needed most of the time. These should only be consulted when relevant to the specific task at hand or when prompted by the user:

- `docs/HistoryOfWork/` - Previous plans and implementations of occaisional/technical/difficult implementations.
- `docs/rulesforAI/` - AI development guidelines and UI component references

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
docs/                     # Background reference materials
├── HistoryOfWork/        # Previous plans and implementations
└── rulesforAI/           # AI development guidelines
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
<!-- usage-rules-start -->
<!-- usage-rules-header -->
# Usage Rules

**IMPORTANT**: Consult these usage rules early and often when working with the packages listed below. 
Before attempting to use any of these packages or to discover if you should use them, review their 
usage rules to understand the correct patterns, conventions, and best practices.
<!-- usage-rules-header-end -->

<!-- ash-start -->
## ash usage
_A declarative, extensible framework for building Elixir applications.
_

[ash usage rules](deps/ash/usage-rules.md)
<!-- ash-end -->
<!-- ash_events-start -->
## ash_events usage
_The extension for tracking changes to your resources via a centralized event log, with replay functionality.
_

[ash_events usage rules](deps/ash_events/usage-rules.md)
<!-- ash_events-end -->
<!-- ash_phoenix-start -->
## ash_phoenix usage
_Utilities for integrating Ash and Phoenix
_

[ash_phoenix usage rules](deps/ash_phoenix/usage-rules.md)
<!-- ash_phoenix-end -->
<!-- ash_authentication-start -->
## ash_authentication usage
_Authentication extension for the Ash Framework.
_

[ash_authentication usage rules](deps/ash_authentication/usage-rules.md)
<!-- ash_authentication-end -->
<!-- igniter-start -->
## igniter usage
_A code generation and project patching framework
_

[igniter usage rules](deps/igniter/usage-rules.md)
<!-- igniter-end -->
<!-- ash_ai-start -->
## ash_ai usage
_Integrated LLM features for your Ash application.
_

[ash_ai usage rules](deps/ash_ai/usage-rules.md)
<!-- ash_ai-end -->
<!-- ash_postgres-start -->
## ash_postgres usage
_The PostgreSQL data layer for Ash Framework
_

[ash_postgres usage rules](deps/ash_postgres/usage-rules.md)
<!-- ash_postgres-end -->
<!-- usage_rules-start -->
## usage_rules usage
_A dev tool for Elixir projects to gather LLM usage rules from dependencies
_

## Using Usage Rules

Many packages have usage rules, which you should *thoroughly* consult before taking any
action. These usage rules contain guidelines and rules *directly from the package authors*.
They are your best source of knowledge for making decisions.

## Modules & functions in the current app and dependencies

When looking for docs for modules & functions that are dependencies of the current project,
or for Elixir itself, use `mix usage_rules.docs`

```
# Search a whole module
mix usage_rules.docs Enum

# Search a specific function
mix usage_rules.docs Enum.zip

# Search a specific function & arity
mix usage_rules.docs Enum.zip/1
```


## Searching Documentation

You should also consult the documentation of any tools you are using, early and often. The best 
way to accomplish this is to use the `usage_rules.search_docs` mix task. Once you have
found what you are looking for, use the links in the search results to get more detail. For example:

```
# Search docs for all packages in the current application, including Elixir
mix usage_rules.search_docs Enum.zip

# Search docs for specific packages
mix usage_rules.search_docs Req.get -p req

# Search docs for multi-word queries
mix usage_rules.search_docs "making requests" -p req

# Search only in titles (useful for finding specific functions/modules)
mix usage_rules.search_docs "Enum.zip" --query-by title
```


<!-- usage_rules-end -->
<!-- usage_rules:elixir-start -->
## usage_rules:elixir usage
# Elixir Core Usage Rules

## Pattern Matching
- Use pattern matching over conditional logic when possible
- Prefer to match on function heads instead of using `if`/`else` or `case` in function bodies

## Error Handling
- Use `{:ok, result}` and `{:error, reason}` tuples for operations that can fail
- Avoid raising exceptions for control flow
- Use `with` for chaining operations that return `{:ok, _}` or `{:error, _}`

## Common Mistakes to Avoid
- Elixir has no `return` statement, nor early returns. The last expression in a block is always returned.
- Don't use `Enum` functions on large collections when `Stream` is more appropriate
- Avoid nested `case` statements - refactor to a single `case`, `with` or separate functions
- Don't use `String.to_atom/1` on user input (memory leak risk)
- Lists and enumerables cannot be indexed with brackets. Use pattern matching or `Enum` functions
- Prefer `Enum` functions like `Enum.reduce` over recursion
- When recursion is necessary, prefer to use pattern matching in function heads for base case detection
- Using the process dictionary is typically a sign of unidiomatic code
- Only use macros if explicitly requested
- There are many useful standard library functions, prefer to use them where possible

## Function Design
- Use guard clauses: `when is_binary(name) and byte_size(name) > 0`
- Prefer multiple function clauses over complex conditional logic
- Name functions descriptively: `calculate_total_price/2` not `calc/2`
- Predicate function names should not start with `is` and should end in a question mark. 
- Names like `is_thing` should be reserved for guards

## Data Structures
- Use structs over maps when the shape is known: `defstruct [:name, :age]`
- Prefer keyword lists for options: `[timeout: 5000, retries: 3]`
- Use maps for dynamic key-value data
- Prefer to prepend to lists `[new | list]` not `list ++ [new]`

## Mix Tasks

- Use `mix help` to list available mix tasks
- Use `mix help task_name` to get docs for an individual task
- Read the docs and options fully before using tasks

## Testing
- Run tests in a specific file with `mix test test/my_test.exs` and a specific test with the line number `mix test path/to/test.exs:123`
- Limit the number of failed tests with `mix test --max-failures n`
- Use `@tag` to tag specific tests, and `mix test --only tag` to run only those tests
- Use `assert_raise` for testing expected exceptions: `assert_raise ArgumentError, fn -> invalid_function() end`
- Use `mix help test` to for full documentation on running tests

## Debugging

- Use `dbg/1` to print values while debugging. This will display the formatted value and other relevant information in the console.

<!-- usage_rules:elixir-end -->
<!-- usage_rules:otp-start -->
## usage_rules:otp usage
# OTP Usage Rules

## GenServer Best Practices
- Keep state simple and serializable
- Handle all expected messages explicitly
- Use `handle_continue/2` for post-init work
- Implement proper cleanup in `terminate/2` when necessary

## Process Communication
- Use `GenServer.call/3` for synchronous requests expecting replies
- Use `GenServer.cast/2` for fire-and-forget messages.
- When in doubt, us `call` over `cast`, to ensure back-pressure
- Set appropriate timeouts for `call/3` operations

## Fault Tolerance
- Set up processes such that they can handle crashing and being restarted by supervisors
- Use `:max_restarts` and `:max_seconds` to prevent restart loops

## Task and Async
- Use `Task.Supervisor` for better fault tolerance
- Handle task failures with `Task.yield/2` or `Task.shutdown/2`
- Set appropriate task timeouts
- Use `Task.async_stream/3` for concurrent enumeration with back-pressure

<!-- usage_rules:otp-end -->
<!-- usage-rules-end -->
