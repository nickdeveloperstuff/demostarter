# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.


##Overall technical architecture of this project

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

```

### Ash Framework Integration
- **Resources**: Defined with `use Ash.Resource` (User, Token models)
- **Domains**: Group related resources (Accounts domain)
- **Actions**: Declarative CRUD and custom actions
- **Authentication**: Built-in token management and user flows
- **Admin**: Auto-generated admin interface at `/admin`

## Dependencies Reference

This section provides an exhaustive list of all dependencies in the Demostarter project with their exact current versions. Use this as a reference when looking up documentation or sharing version information with team members.

### Core Framework & Runtime

- **Elixir**: ~> 1.15 (specified in mix.exs)
- **Phoenix**: 1.8.0-rc.4 (override: true)
- **Phoenix LiveView**: 1.1.0-rc.3
- **Phoenix PubSub**: 2.1.3
- **Phoenix Template**: 1.0.4
- **Phoenix View**: 2.0.4
- **Phoenix HTML**: 4.2.1
- **Phoenix Ecto**: 4.6.5
- **Bandit**: 1.7.0 (HTTP server)

### Ash Framework Ecosystem

- **Ash**: 3.5.30 (core framework)
- **Ash Phoenix**: 2.3.11 (Phoenix integration)
- **Ash Postgres**: 2.6.11 (PostgreSQL data layer)
- **Ash SQL**: 0.2.86 (SQL support)
- **Ash Authentication**: 4.9.7 (authentication system)
- **Ash Authentication Phoenix**: 2.10.3 (Phoenix auth integration)
- **Ash Admin**: 0.13.12 (admin interface)
- **Ash AI**: 0.2.8 (LLM integration)
- **Ash JSON API**: 1.4.37 (JSON API support)
- **Ash Events**: 0.4.3 (event tracking)
- **Ash Paper Trail**: 0.5.6 (audit trail)
- **Ash State Machine**: 0.2.11 (state machine support)
- **Ash Cloak**: 0.1.6 (encryption)

### Database & Data

- **Ecto**: 3.13.2 (database wrapper)
- **Ecto SQL**: 3.13.2 (SQL support)
- **Postgrex**: 0.20.0 (PostgreSQL driver)
- **DB Connection**: 2.8.0 (database connection pooling)
- **Decimal**: 2.3.0 (decimal arithmetic)

### Authentication & Security

- **BCrypt Elixir**: 3.3.2 (password hashing)
- **Comeonin**: 5.5.1 (password hashing framework)
- **Cloak**: 1.1.4 (encryption)
- **Joken**: 2.6.2 (JWT tokens)
- **Jose**: 1.11.10 (JSON Web encryption/signing)
- **Assent**: 0.2.13 (OAuth/OpenID Connect)
- **CaStore**: 1.0.14 (CA certificate store)

### Frontend & Assets

- **Tailwind**: 0.3.1 (CSS framework)
- **ESBuild**: 0.10.0 (JavaScript bundler)
- **Heroicons**: v2.2.0 (icon library - git dependency)
- **Phoenix Live Dashboard**: 0.8.7
- **Phoenix Live Reload**: 1.6.0 (dev only)

### HTTP & Networking

- **Plug**: 1.18.1 (HTTP middleware)
- **Plug Crypto**: 2.1.1 (cryptographic functions)
- **Finch**: 0.20.0 (HTTP client)
- **Mint**: 1.7.1 (HTTP client)
- **Req**: 0.5.15 (HTTP client)
- **Swoosh**: 1.19.3 (email)
- **DNS Cluster**: 0.2.0 (DNS-based clustering)
- **WebSock**: 0.5.3 (WebSocket support)
- **WebSock Adapter**: 0.5.8

### Development & Build Tools

- **Igniter**: 0.6.25 (code generation framework)
- **File System**: 1.1.0 (file system monitoring)
- **Phoenix HTML Helpers**: 1.0.1
- **Live Debugger**: 0.3.1 (dev only)
- **Tidewave**: 0.2.0 (dev only - Elixir development server)
- **Usage Rules**: 0.1.22 (dev only - dependency documentation)

### Utilities & Support

- **Jason**: 1.4.4 (JSON encoding/decoding)
- **Gettext**: 0.26.2 (internationalization)
- **Telemetry**: 1.3.0 (metrics and instrumentation)
- **Telemetry Metrics**: 1.1.0
- **Telemetry Poller**: 1.3.0
- **Stream Data**: 1.2.0 (property-based testing)
- **Slugify**: 1.3.1 (URL slug generation)

### Core Language & Framework Support

- **Reactor**: 0.15.6 (workflow engine)
- **Spark**: 2.2.67 (DSL framework)
- **Splode**: 0.2.9 (error handling)
- **Sourceror**: 1.10.0 (Elixir AST utilities)
- **Rewrite**: 1.1.2 (code transformation)
- **Spitfire**: 0.2.1 (performance utilities)
- **Glob Ex**: 0.1.11 (file globbing)
- **Owl**: 0.12.2 (terminal UI)
- **Fine**: 0.1.1 (performance monitoring)
- **ETS**: 0.9.0 (Erlang Term Storage wrapper)
- **Iterex**: 0.1.2 (iteration utilities)
- **LibGraph**: 0.16.0 (graph data structures)
- **Circular Buffer**: 1.0.0

### Specialized Libraries

- **LangChain**: 0.3.3 (LLM integration)
- **Open API Spex**: 3.21.5 (OpenAPI specification)
- **JSON Xema**: 0.6.5 (JSON schema validation)
- **Xema**: 0.17.5 (schema validation)
- **Conv Case**: 0.2.3 (case conversion)
- **Expo**: 1.1.0 (gettext utilities)
- **Text Diff**: 0.1.0 (text diffing)

### Compilation & Build

- **Elixir Make**: 0.9.0 (native code compilation)
- **CC Precompiler**: 0.1.10 (C compiler utilities)
- **Lazy HTML**: 0.1.3 (HTML processing)
- **PicoSAT Elixir**: 0.2.3 (SAT solver)
- **Thousand Island**: 1.3.14 (socket acceptor pool)
- **HPax**: 1.0.3 (HTTP/2 protocol support)

### Data Processing & Parsing

- **YAML Elixir**: 2.11.0 (YAML parsing)
- **YMLR**: 5.1.4 (YAML processing)
- **Yamerl**: 0.10.0 (YAML parsing)
- **MIME**: 2.0.7 (MIME type detection)
- **Nimble Options**: 1.1.1 (option parsing)
- **Nimble Pool**: 1.1.0 (pool management)

### Node.js Dependencies

- **Package.json**: Empty (no Node.js dependencies currently)
- **Package-lock.json**: Present but minimal

### Lock File Status

✅ **mix.lock**: Committed to git with 94 locked dependencies  
✅ **package-lock.json**: Committed to git  
✅ **.gitignore**: Does not exclude lock files  

All dependencies are fully locked to their exact versions with checksums for complete reproducibility.

Last updated: 2025-07-25

## LEGO UI System

The project uses a constrained LEGO-style UI system that enforces design consistency through compile-time validation. **IMPORTANT: Every UI element must be a widget. No direct HTML, CSS classes, or DaisyUI components are allowed in templates.**

### Key Concepts

1. **Widget-Only Development**: ALL UI elements must be widgets - no exceptions
2. **12-Column Grid**: All layouts use a 12-column CSS Grid system
3. **Fixed Widget Sizes**: Only specific size combinations are allowed
4. **Compile-time Validation**: Invalid sizes and non-widget usage cause compilation errors
5. **Container Queries**: Widgets respond to their container size

### Widget Sizes

Only these widget sizes are allowed:
- **1x1**: Status indicators, small metrics
- **2x1**: Key metrics, small stats
- **2x2**: Medium content, small charts
- **3x1**: User info, activity cards
- **3x2**: Lists, medium charts
- **4x1**: Wide cards, CTAs
- **4x2**: Large visualizations
- **6x1**: Half-width sections
- **6x2**: Large dashboards
- **12x1**: Full-width banners
- **12x2**: Full-width extended content

### Development Rules

1. **NO HTML elements** in templates (no `<div>`, `<button>`, etc.)
2. **NO CSS classes** in templates (no `class="..."` at all)
3. **NO DaisyUI components** in templates (use widget wrappers)
4. **ONLY widgets** can be used to build UI
5. Run `mix lego.validate` before committing

### Component Usage

```heex
<!-- Phase 1 (temporary - sets up foundation) -->
<.lego_container>
  <.lego_widget size="2x1" title="Revenue">
    <div>$42,000</div>  <!-- Raw HTML temporarily allowed in Phase 1 -->
  </.lego_widget>
</.lego_container>

<!-- Phase 2 (final - everything is a widget) -->
<.container_widget>
  <.card_widget size="2x1" title="Revenue">
    <.text_widget size="2xl" weight="bold">$42,000</.text_widget>
  </.card_widget>
</.container_widget>
```

### Validation Commands

```bash
mix lego.validate        # Check for violations
mix lego.cleanup        # Find deprecated patterns
mix compile            # Compile-time size validation
```

## Development Guidelines

### Code Style
- Uses standard Elixir formatting via `mix format`
- Configured in `.formatter.exs` with Ash-specific formatting rules
- Snake_case for variables and functions, PascalCase for modules
- Document public functions with `@doc` and modules with `@moduledoc`


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
