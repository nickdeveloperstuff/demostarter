####!!ALL AVAILABLE UI COMPONENTS -- THIS PROJECT SHOULD ONLY USE THE BELOW UI COMPONENTS!! DO NOT ATTEMPT TO CREATE ORIGINAL COMPONENTS OR ATTEMPT TO IMPORT ANY OTHER COMPONENT LIBRARIES.!!####

## Lego Brick Philosophy

These components are **building blocks** for creating complete UI features and pages. Use them exactly as documented with **zero modifications** - no custom styling, no business logic, just standard implementation with natural styling inheritance.

**Visual Reference:** See all components in action at `/ui-components` - this is your definitive visual validation tool.

## Component Hierarchy & Usage Priority

1. **DaisyUI Components** - Primary choice for most UI elements (buttons, cards, navbars, etc.)
2. **Phoenix LiveView Components** - For functional components requiring forms, state, errors, navigation
3. **Ash Authentication Components** - Specifically for auth pages only

## Implementation Standards

- **Phoenix Components:** Use `<.component>` syntax with proper attributes
- **DaisyUI Components:** Use standard HTML + CSS classes exactly as documented  
- **Natural Inheritance:** Let existing app.css and root.html.heex handle all styling
- **Dummy Data:** Use minimal, realistic sample data ("John Doe", "Sample Text", etc.)
- **No Business Logic:** Keep all UI implementations purely visual

## Icons for Whole Project
**From:** Heroicons library


## 1. Core Phoenix LiveView Functional Components

**Location:** `lib/demostarter_web/components/core_components.ex`

### Implementation Examples

```heex
<!-- Flash Messages -->
<.flash kind={:info}>This is an info message</.flash>
<.flash kind={:error}>This is an error message</.flash>

<!-- Buttons -->
<.button>Default Button</.button>
<.button variant="primary">Primary Button</.button>

<!-- Form Input -->
<.input name="username" label="Username" value="sample_user" />

<!-- Page Header -->
<.header>Sample Page Title</.header>

<!-- Data Table -->
<.table id="users-table" rows={[%{name: "John Doe", email: "john@example.com"}]}>
  <:col :let={user} label="Name">{user.name}</:col>
  <:col :let={user} label="Email">{user.email}</:col>
</.table>

<!-- List -->
<.list>
  <:item title="Item 1">Description for item 1</:item>
  <:item title="Item 2">Description for item 2</:item>
</.list>

<!-- Icons -->
<.icon name="hero-home" class="w-6 h-6" />
<.icon name="hero-user" class="w-6 h-6" />
<.icon name="hero-star" class="w-6 h-6" />
```

### Available Components
- `<.flash>` - Flash notifications (info/error variants)
- `<.button>` - Interactive buttons (default/primary variants)
- `<.input>` - Form inputs with labels/errors
- `<.header>` - Page headers
- `<.table>` - Data tables with columns
- `<.list>` - Data lists with items
- `<.icon>` - Heroicons with `hero-*` naming



## 2. DaisyUI Components Available

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
3. **Include data display** (Phoenix tables/lists or DaisyUI stats)
4. **Add interactions** (DaisyUI buttons, modals, forms)
5. **Provide feedback** (Phoenix flash or DaisyUI alerts)

**Remember:** Use `/ui-components` to see all components visually before building your UI features.