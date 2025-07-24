# Suggested Commands for Development

## Setup
```bash
mix setup              # Install dependencies, setup database, build assets
```

## Development
```bash
mix phx.server          # Start Phoenix server
iex -S mix phx.server   # Start with interactive Elixir shell
```

## Database
```bash
mix ash.setup           # Setup Ash resources and database
mix ecto.create         # Create database
mix ecto.migrate        # Run migrations
mix ecto.drop           # Drop database
mix ecto.reset          # Drop and recreate database
```

## Assets
```bash
mix assets.setup        # Install Tailwind and esbuild
mix assets.build        # Build CSS and JS assets
mix assets.deploy       # Build and minify for production
```

## Testing
```bash
mix test               # Run tests (sets up Ash resources first)
```

## Formatting
```bash
mix format             # Format Elixir code
```

## System Commands (Darwin/macOS)
- `ls` - List files
- `cd` - Change directory
- `grep` - Search text
- `find` - Find files
- `git` - Version control