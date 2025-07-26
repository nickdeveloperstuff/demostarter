####!!ALL AVAILABLE UI COMPONENTS -- THIS PROJECT SHOULD ONLY USE THE BELOW UI COMPONENTS!! DO NOT ATTEMPT TO CREATE ORIGINAL COMPONENTS OR ATTEMPT TO IMPORT ANY OTHER COMPONENT LIBRARIES.!!####

## Lego Brick Philosophy

These components are **building blocks** for creating complete UI features and pages. Use them exactly as documented with **zero modifications** - no custom styling, no business logic, just standard implementation with natural styling inheritance.

**Visual Reference:** See all components in action at `/ui-components` - this is your definitive visual validation tool.

## Component Hierarchy & Usage Priority

1. **DaisyUI Components** - DEFAULT choice for ALL UI elements (buttons, cards, navbars, forms, tables, etc.)
2. **Icons** - Use Phoenix `<.icon>` component ONLY for icons with `hero-*` naming
3. **Ash Authentication Components** - Specifically for auth pages only
4. **Phoenix LiveView Components** - Use ONLY when explicitly directed by user

## Implementation Standards

- **DaisyUI Components (PRIMARY):** Use standard HTML + CSS classes exactly as documented  
- **Icons (ONLY EXCEPTION):** Use `<.icon name="hero-*" class="..." />` syntax with proper attributes
- **Phoenix Components:** Use ONLY when explicitly directed by user with `<.component>` syntax
- **Natural Inheritance:** Let existing app.css and root.html.heex handle all styling
- **Dummy Data:** Use minimal, realistic sample data ("John Doe", "Sample Text", etc.)
- **No Business Logic:** Keep all UI implementations purely visual

## Icons - The Only Phoenix Component Exception

**Use ONLY the Phoenix `<.icon>` component for icons** - this is the single exception to the DaisyUI-only rule.

### Icon Implementation Examples

```heex
<!-- Basic usage -->
<.icon name="hero-bell" class="h-6 w-6" />
<.icon name="hero-users" class="size-8" />
<.icon name="hero-chart-bar" class="inline-block w-8 h-8" />

<!-- With DaisyUI components -->
<button class="btn btn-primary">
  <.icon name="hero-plus" class="h-5 w-5" />
  Add Item
</button>

<div class="alert alert-success">
  <.icon name="hero-check-circle" class="shrink-0 h-6 w-6" />
  <span>Success message</span>
</div>

<div class="stat">
  <div class="stat-figure text-primary">
    <.icon name="hero-currency-dollar" class="inline-block w-8 h-8" />
  </div>
  <div class="stat-title">Revenue</div>
  <div class="stat-value">$12,345</div>
</div>
```

### Available Icon Variants
- **Outline (default):** `hero-name`
- **Solid:** `hero-name-solid`  
- **Mini:** `hero-name-mini`
- **Micro:** `hero-name-micro`

### Common Icons for UI
- `hero-bell` - Notifications, alerts
- `hero-users` - User counts, people
- `hero-chart-bar` - Analytics, statistics  
- `hero-currency-dollar` - Revenue, money
- `hero-shopping-bag` - Orders, purchases
- `hero-information-circle` - Info messages
- `hero-check-circle` - Success states
- `hero-exclamation-triangle` - Warnings
- `hero-document-text` - Reports, documents
- `hero-plus` - Add actions
- `hero-pencil` - Edit actions
- `hero-trash` - Delete actions


## 1. DaisyUI Components - Your Primary Building Blocks

These are your primary building blocks for most UI elements. Use standard HTML structure with DaisyUI CSS classes exactly as documented.

### Implementation Examples

```html
<!-- Basic Button -->
<button class="btn">Button</button>
<button class="btn btn-primary">Primary</button>

<!-- Card -->
<div class="card w-96 bg-base-100 shadow-xl">
  <div class="card-body">
    <h2 class="card-title">Sample Card</h2>
    <p>Sample content here</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>

<!-- Form Input -->
<input type="text" placeholder="Sample input" class="input input-bordered w-full max-w-xs" />

<!-- Alert -->
<div class="alert alert-info">
  <span>Sample alert message</span>
</div>
```

## Layout Components
- **Artboard** - Device mockups - `/saadeghi/daisyui`
- **Divider** - Visual separator between content - `/saadeghi/daisyui`
- **Drawer** - Side panel/sidebar navigation - `/saadeghi/daisyui`
- **Footer** - Website footer section - `/saadeghi/daisyui`
- **Hero** - Large header section with content - `/saadeghi/daisyui`
- **Indicator** - Small notification overlay - `/saadeghi/daisyui`
- **Join** - Groups elements together - `/saadeghi/daisyui`
- **Mask** - Image clipping shapes - `/saadeghi/daisyui`
- **Stack** - Stacked elements - `/saadeghi/daisyui`

## Navigation Components
- **Breadcrumbs** - Navigation trail - `/saadeghi/daisyui`
- **Dock** - Bottom navigation (replaces Bottom Navigation) - `/saadeghi/daisyui`
- **Link** - Styled anchor links - `/saadeghi/daisyui`
- **Menu** - Navigation menu lists - `/saadeghi/daisyui`
- **Navbar** - Top navigation bar - `/saadeghi/daisyui`
- **Pagination** - Page navigation - `/saadeghi/daisyui`
- **Steps** - Step-by-step progress - `/saadeghi/daisyui`
- **Tab** - Tabbed navigation - `/saadeghi/daisyui`

## Data Display Components
- **Avatar** - User profile pictures - `/saadeghi/daisyui`
- **Badge** - Small status indicators - `/saadeghi/daisyui`
- **Calendar** - Date picker/display - `/saadeghi/daisyui`
- **Card** - Content containers - `/saadeghi/daisyui`
- **Carousel** - Image/content slider - `/saadeghi/daisyui`
- **Chat** - Chat message bubbles - `/saadeghi/daisyui`
- **Collapse** - Expandable content sections - `/saadeghi/daisyui`
- **Countdown** - Timer display - `/saadeghi/daisyui`
- **Diff** - Before/after image comparison - `/saadeghi/daisyui`
- **Kbd** - Keyboard key display - `/saadeghi/daisyui`
- **List** - Structured data rows - `/saadeghi/daisyui`
- **Stat** - Statistics display - `/saadeghi/daisyui`
- **Table** - Data tables - `/saadeghi/daisyui`
- **Timeline** - Chronological events - `/saadeghi/daisyui`

## Actions Components
- **Button** - Clickable buttons - `/saadeghi/daisyui`
- **Dropdown** - Context menus - `/saadeghi/daisyui`
- **Modal** - Overlay dialogs - `/saadeghi/daisyui`
- **Swap** - Icon/content swapper - `/saadeghi/daisyui`
- **Theme Controller** - Theme switching - `/saadeghi/daisyui`

## Form Components
- **Checkbox** - Boolean selection - `/saadeghi/daisyui`
- **File Input** - File upload - `/saadeghi/daisyui`
- **Input** - Text input fields - `/saadeghi/daisyui`
- **Radio** - Single selection - `/saadeghi/daisyui`
- **Range** - Slider inputs - `/saadeghi/daisyui`
- **Rating** - Star ratings - `/saadeghi/daisyui`
- **Select** - Dropdown selection - `/saadeghi/daisyui`
- **Textarea** - Multi-line text - `/saadeghi/daisyui`
- **Toggle** - Switch buttons - `/saadeghi/daisyui`

## Feedback Components
- **Alert** - Status messages - `/saadeghi/daisyui`
- **Loading** - Loading spinners - `/saadeghi/daisyui`
- **Progress** - Progress bars - `/saadeghi/daisyui`
- **Radial Progress** - Circular progress - `/saadeghi/daisyui`
- **Skeleton** - Loading placeholders - `/saadeghi/daisyui`
- **Toast** - Notification messages - `/saadeghi/daisyui`
- **Tooltip** - Hover information - `/saadeghi/daisyui`

## Mockup Components
- **Browser** - Browser mockup - `/saadeghi/daisyui`
- **Code** - Code block display - `/saadeghi/daisyui`
- **Phone** - Mobile device mockup - `/saadeghi/daisyui`
- **Window** - Desktop window mockup - `/saadeghi/daisyui`

## Component Variations

Each component includes multiple customization options:

### Size Variations
- `xs` - Extra small
- `sm` - Small  
- `md` - Medium (default)
- `lg` - Large
- `xl` - Extra large

### Color Themes
- `primary` - Primary theme color
- `secondary` - Secondary theme color
- `accent` - Accent theme color
- `neutral` - Neutral color
- `success` - Success/positive color
- `warning` - Warning color
- `info` - Information color
- `error` - Error/danger color

### Usage Examples

```html
<!-- Basic button -->
<button class="btn">Button</button>

<!-- Primary button with large size -->
<button class="btn btn-primary btn-lg">Large Primary Button</button>

<!-- Card with shadow -->
<div class="card w-96 bg-base-100 shadow-xl">
  <div class="card-body">
    <h2 class="card-title">Card Title</h2>
    <p>Card content goes here</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>

<!-- Modal -->
<dialog class="modal">
  <div class="modal-box">
    <h3 class="font-bold text-lg">Modal Title</h3>
    <p class="py-4">Modal content</p>
  </div>
</dialog>
```

## 3. Specialized Components

### Auth Components (ash_authentication_phoenix)
**Use only for authentication pages**

- `AshAuthentication.Phoenix.Components.SignIn` - Sign-in forms
- `AshAuthentication.Phoenix.Components.Password.RegisterForm` - Registration
- `AshAuthentication.Phoenix.Components.Reset` - Password reset
- `AshAuthentication.Phoenix.Components.OAuth2` - OAuth authentication

### Admin Components (ash_admin)
**Use only for admin routes**

- `AshAdmin.CoreComponents` - Admin UI elements

## Dummy Data Patterns

When building UI mockups, use these consistent dummy data patterns:

- **Names:** "John Doe", "Jane Smith", "Alex Johnson"
- **Emails:** "john@example.com", "jane@example.com"
- **Content:** "Sample text", "Demo content", "Example description"
- **Numbers:** Round numbers like 100, 250, 1000
- **Dates:** "2024-01-15", "March 15, 2024"
- **Status:** "Active", "Pending", "Completed"

## Building Complete UI Features

Combine these components as building blocks:

1. **Start with layout** (DaisyUI cards, heroes, dividers)
2. **Add navigation** (DaisyUI menus, breadcrumbs, tabs)
3. **Include data display** (DaisyUI stats, tables, lists)
4. **Add interactions** (DaisyUI buttons, modals, forms)
5. **Provide feedback** (DaisyUI alerts, toasts, progress)
6. **Include icons** (Phoenix `<.icon name="hero-*">` components)

**Remember:** Use `/ui-components` to see all components visually before building your UI features.

---

## ⚠️ Phoenix LiveView Components - Use Only When Explicitly Directed

**DO NOT USE THESE COMPONENTS UNLESS EXPLICITLY TOLD BY THE USER**

These components should ONLY be used when the user specifically asks for Phoenix components. By default, always use DaisyUI equivalents instead.

### Why DaisyUI is Preferred
- **Consistency:** All styling handled by DaisyUI theme
- **Flexibility:** More component options and variations
- **Simplicity:** Standard HTML + CSS classes vs. complex component syntax
- **Performance:** Lighter weight than Phoenix components for pure UI

### Phoenix Components (Use Only When Directed)

**Location:** `lib/demostarter_web/components/core_components.ex`

```heex
<!-- Flash Messages (prefer DaisyUI alerts) -->
<.flash kind={:info}>This is an info message</.flash>
<.flash kind={:error}>This is an error message</.flash>

<!-- Buttons (prefer DaisyUI buttons) -->
<.button>Default Button</.button>
<.button variant="primary">Primary Button</.button>

<!-- Form Input (prefer DaisyUI inputs) -->
<.input name="username" label="Username" value="sample_user" />

<!-- Page Header (prefer DaisyUI hero) -->
<.header>Sample Page Title</.header>

<!-- Data Table (prefer DaisyUI table) -->
<.table id="users-table" rows={[%{name: "John Doe", email: "john@example.com"}]}>
  <:col :let={user} label="Name">{user.name}</:col>
  <:col :let={user} label="Email">{user.email}</:col>
</.table>

<!-- List (prefer DaisyUI lists) -->
<.list>
  <:item title="Item 1">Description for item 1</:item>
  <:item title="Item 2">Description for item 2</:item>
</.list>
```

### Available Phoenix Components (Discouraged Unless Directed)
- `<.flash>` - Flash notifications *(prefer DaisyUI alerts)*
- `<.button>` - Interactive buttons *(prefer DaisyUI buttons)*
- `<.input>` - Form inputs *(prefer DaisyUI inputs)*
- `<.header>` - Page headers *(prefer DaisyUI hero)*
- `<.table>` - Data tables *(prefer DaisyUI table)*
- `<.list>` - Data lists *(prefer DaisyUI lists)*
- `<.icon>` - **EXCEPTION: Always use this for icons**