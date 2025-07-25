# Dependencies Reference

This document provides an exhaustive list of all dependencies in the Demostarter project with their exact current versions. Use this as a reference when looking up documentation or sharing version information with team members.

## Core Framework & Runtime

- **Elixir**: ~> 1.15 (specified in mix.exs)
- **Phoenix**: 1.8.0-rc.4 (override: true)
- **Phoenix LiveView**: 1.1.0-rc.3
- **Phoenix PubSub**: 2.1.3
- **Phoenix Template**: 1.0.4
- **Phoenix View**: 2.0.4
- **Phoenix HTML**: 4.2.1
- **Phoenix Ecto**: 4.6.5
- **Bandit**: 1.7.0 (HTTP server)

## Ash Framework Ecosystem

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

## Database & Data

- **Ecto**: 3.13.2 (database wrapper)
- **Ecto SQL**: 3.13.2 (SQL support)
- **Postgrex**: 0.20.0 (PostgreSQL driver)
- **DB Connection**: 2.8.0 (database connection pooling)
- **Decimal**: 2.3.0 (decimal arithmetic)

## Authentication & Security

- **BCrypt Elixir**: 3.3.2 (password hashing)
- **Comeonin**: 5.5.1 (password hashing framework)
- **Cloak**: 1.1.4 (encryption)
- **Joken**: 2.6.2 (JWT tokens)
- **Jose**: 1.11.10 (JSON Web encryption/signing)
- **Assent**: 0.2.13 (OAuth/OpenID Connect)
- **CaStore**: 1.0.14 (CA certificate store)

## Frontend & Assets

- **Tailwind**: 0.3.1 (CSS framework)
- **ESBuild**: 0.10.0 (JavaScript bundler)
- **Heroicons**: v2.2.0 (icon library - git dependency)
- **Phoenix Live Dashboard**: 0.8.7
- **Phoenix Live Reload**: 1.6.0 (dev only)

## HTTP & Networking

- **Plug**: 1.18.1 (HTTP middleware)
- **Plug Crypto**: 2.1.1 (cryptographic functions)
- **Finch**: 0.20.0 (HTTP client)
- **Mint**: 1.7.1 (HTTP client)
- **Req**: 0.5.15 (HTTP client)
- **Swoosh**: 1.19.3 (email)
- **DNS Cluster**: 0.2.0 (DNS-based clustering)
- **WebSock**: 0.5.3 (WebSocket support)
- **WebSock Adapter**: 0.5.8

## Development & Build Tools

- **Igniter**: 0.6.25 (code generation framework)
- **File System**: 1.1.0 (file system monitoring)
- **Phoenix HTML Helpers**: 1.0.1
- **Live Debugger**: 0.3.1 (dev only)
- **Tidewave**: 0.2.0 (dev only - Elixir development server)
- **Usage Rules**: 0.1.22 (dev only - dependency documentation)

## Utilities & Support

- **Jason**: 1.4.4 (JSON encoding/decoding)
- **Gettext**: 0.26.2 (internationalization)
- **Telemetry**: 1.3.0 (metrics and instrumentation)
- **Telemetry Metrics**: 1.1.0
- **Telemetry Poller**: 1.3.0
- **Stream Data**: 1.2.0 (property-based testing)
- **Slugify**: 1.3.1 (URL slug generation)

## Core Language & Framework Support

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

## Specialized Libraries

- **LangChain**: 0.3.3 (LLM integration)
- **Open API Spex**: 3.21.5 (OpenAPI specification)
- **JSON Xema**: 0.6.5 (JSON schema validation)
- **Xema**: 0.17.5 (schema validation)
- **Conv Case**: 0.2.3 (case conversion)
- **Expo**: 1.1.0 (gettext utilities)
- **Text Diff**: 0.1.0 (text diffing)

## Compilation & Build

- **Elixir Make**: 0.9.0 (native code compilation)
- **CC Precompiler**: 0.1.10 (C compiler utilities)
- **Lazy HTML**: 0.1.3 (HTML processing)
- **PicoSAT Elixir**: 0.2.3 (SAT solver)
- **Thousand Island**: 1.3.14 (socket acceptor pool)
- **HPax**: 1.0.3 (HTTP/2 protocol support)

## Data Processing & Parsing

- **YAML Elixir**: 2.11.0 (YAML parsing)
- **YMLR**: 5.1.4 (YAML processing)
- **Yamerl**: 0.10.0 (YAML parsing)
- **MIME**: 2.0.7 (MIME type detection)
- **Nimble Options**: 1.1.1 (option parsing)
- **Nimble Pool**: 1.1.0 (pool management)

## Node.js Dependencies

- **Package.json**: Empty (no Node.js dependencies currently)
- **Package-lock.json**: Present but minimal

---

## Lock File Status

✅ **mix.lock**: Committed to git with 94 locked dependencies  
✅ **package-lock.json**: Committed to git  
✅ **.gitignore**: Does not exclude lock files  

All dependencies are fully locked to their exact versions with checksums for complete reproducibility.

Last updated: 2025-07-25