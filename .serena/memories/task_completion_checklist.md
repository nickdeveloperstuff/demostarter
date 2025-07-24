# Task Completion Checklist

When completing development tasks, ensure:

## Code Quality
- [ ] Run `mix format` to format Elixir code
- [ ] Ensure no compilation warnings with `mix compile --warnings-as-errors`
- [ ] Check that all tests pass with `mix test`

## Assets and Build
- [ ] Rebuild assets with `mix assets.build` if CSS/JS changes were made
- [ ] Verify the application starts with `mix phx.server`
- [ ] Test in browser at `localhost:4000`

## Database Changes
- [ ] If Ash resources changed, run `mix ash.setup` to update database
- [ ] Verify migrations work correctly
- [ ] Check that seed data loads properly

## Documentation
- [ ] Update relevant `@doc` and `@moduledoc` comments
- [ ] Update README if public interface changes
- [ ] Document any new configuration options

## Testing
- [ ] Add or update tests for new functionality
- [ ] Test authentication flows if auth-related changes
- [ ] Test admin interface if resources modified

## Final Verification
- [ ] Clean restart: `mix deps.clean --all && mix setup`
- [ ] Full test suite: `mix test`
- [ ] Manual testing of affected features