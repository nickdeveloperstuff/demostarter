# Creating New Routes and Pages - RULES

## ⚠️ IMPORTANT: SCOPE OF THIS DOCUMENT

**This document is ONLY for creating a new route with a new placeholder page.**

- ✅ Creating a new route in the router
- ✅ Creating a new LiveView module with placeholder content
- ✅ Setting up proper authentication (public/private)
- ❌ NO business logic
- ❌ NO fancy UI  
- ❌ NO additional features

**If the user wants anything beyond a basic route + page, that's a SEPARATE task to be done AFTER following these rules.**

## Quick Start

1. **Check current docs**: Use Context7 to look up `/ash-project/ash` and `/phoenixframework/phoenix_live_view` for patterns matching your project versions
2. **Add route**: Edit `lib/demostarter_web/router.ex`
3. **Create LiveView**: Add new file in `lib/demostarter_web/live/`
4. **Test**: Visit the new route

## Step 1: Check Documentation First

Before creating anything, use Context7 to get current examples:
- Search `/phoenixframework/phoenix_live_view` for "routing" 
- Search `/ash-project/ash` for "authentication routing"
- Search `/team-alembic/ash_authentication` for auth patterns

This ensures your code matches the exact library versions in this project.

## Step 2: Add Route to Router

Edit `lib/demostarter_web/router.ex`:

### For PRIVATE routes (requires login):
Add inside the `ash_authentication_live_session :authenticated_routes` block:
```elixir
live "/your-path", YourLive
```

### For PUBLIC routes:
Add inside a regular `scope` block:
```elixir
live "/your-path", YourLive
```

## Step 3: Create LiveView Module

Create new file in `lib/demostarter_web/live/` directory:

```elixir
defmodule DemostarterWeb.YourLive do
  use DemostarterWeb, :live_view
  
  # For PRIVATE pages, add this:
  on_mount {DemostarterWeb.LiveUserAuth, :live_user_required}
  
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
  
  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1>Placeholder Page</h1>
      <p>Replace this with actual content later.</p>
    </div>
    """
  end
end
```

## Directory Structure

Place LiveView files here:
- `lib/demostarter_web/live/` - Main LiveView modules
- `lib/demostarter_web/live/your_feature/` - Feature-specific subdirectories

## Authentication Options

Add one of these `on_mount` declarations to your LiveView:

- **Required login**: `on_mount {DemostarterWeb.LiveUserAuth, :live_user_required}`
- **Optional login**: `on_mount {DemostarterWeb.LiveUserAuth, :live_user_optional}`
- **No user allowed**: `on_mount {DemostarterWeb.LiveUserAuth, :live_no_user}`

## Layout Inheritance (Automatic)

DO NOT CHANGE ANY APP.CSS OR ANY OTHER STYLING.

All pages automatically inherit:
- ✅ No horizontal scrolling (even with 3000px content)
- ✅ Responsive design (flex/grid auto-wrap)
- ✅ Consistent background colors
- ✅ Smooth vertical scrolling

This happens automatically via `root.html.heex` and APP.CSS - no setup needed, AND DO NOT MODIFY EITHER OF THOSE.

## Testing Your Route

1. Start server: `mix phx.server`
2. Visit: `http://localhost:4000/your-path`
3. Verify authentication works as expected

## Remember

This document is ONLY for creating the route + placeholder page. Any additional features, business logic, or UI enhancements are separate tasks to be done AFTER the basic route is working.