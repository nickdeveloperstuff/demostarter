####!!ALL AVAILABLE UI COMPONENTS -- THIS PROJECT SHOULD ONLY USE THE BELOW UI COMPONENTS!! DO NOT ATTEMPT TO CREATE ORIGINAL COMPONENTS OR ATTEMPT TO IMPORT ANY OTHER COMPONENT LIBRARIES.!!####

## There are two main types of UI components in this project: 1--Core Phoenix Liveview Functional Components For Functional UI Stuff that requires forms, state, errors, etc. that need to be tightly integrated with business logic and data; and  2--The DaisyUI Components Available below are the most comprehensive and are the rest of the UI components available for use in this project.

## Icons for Whole Project
**From:** Heroicons library


##1--Core Phoenix Liveview Functional Components For Functional UI Stuff

**Location:** `lib/<your_app>/components/core_components.ex`

- `<.flash>` - Flash notifications
- `<.button>` - Interactive buttons  
- `<.input>` - Form inputs with labels/errors
- `<.header>` - Page headers
- `<.table>` - Data tables
- `<.list>` - Data lists
- `<.icon>` - Heroicons



Usage: `<.icon name="hero-x-mark">` syntax



##2-- DaisyUI Components Available

This document lists all DaisyUI components that are currently installed and available for use in this project.

## Component Location
All components are available in the vendor files:
- `assets/vendor/daisyui.js` 
- `assets/vendor/daisyui-theme.js`

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

### For Other Stuff in Project##

## Auth Components for Main Auth Page
**From:** ash_authentication_phoenix

- `AshAuthentication.Phoenix.Components.SignIn` - Sign-in forms
- `AshAuthentication.Phoenix.Components.Password.RegisterForm` - Registration
- `AshAuthentication.Phoenix.Components.Reset` - Password reset
- `AshAuthentication.Phoenix.Components.OAuth2` - OAuth authentication

## Admin UI Route Components
**From:** ash_admin

- `AshAdmin.CoreComponents` - Admin UI elements