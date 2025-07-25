# Phoenix LiveView Automatic Layout System

This document describes the implementation of a comprehensive layout system for Phoenix LiveView applications that automatically prevents horizontal scrolling, enables responsive design, and provides optional snap scrolling features.

## Overview

The layout system is implemented using only two files:
- `assets/css/app.css` - Global CSS rules
- `lib/demostarter_web/components/layouts/root.html.heex` - Root HTML structure

Once implemented, ALL pages in the application will automatically inherit these behaviors without developers needing to follow any special patterns.

## Features

- ✅ **Complete horizontal scroll prevention** - No horizontal scrolling under any circumstances
- ✅ **Automatic responsive layout** - Content automatically stacks vertically on smaller screens
- ✅ **Background color continuity** - Consistent background color during overscroll
- ✅ **Optional snap scrolling** - Page-by-page vertical scrolling when desired
- ✅ **Touch device protection** - Prevents horizontal swipe scrolling on mobile
- ✅ **Zero configuration for new pages** - Works automatically with all routes

## Implementation

### Step 1: CSS Rules (app.css)

Add the following rules to `assets/css/app.css` after the existing content:

```css
/* =================================================================
   AUTOMATIC LAYOUT SYSTEM
   Prevents horizontal scrolling and enables responsive design
   ================================================================= */

/* Reset and base layout rules - applies to EVERYTHING */
*, *::before, *::after {
  box-sizing: border-box;
  max-width: 100%;
}

/* Root elements configuration */
html {
  /* Completely prevent horizontal scrolling */
  overflow-x: hidden;
  overflow-y: auto;
  
  /* Smooth scrolling for better UX */
  scroll-behavior: smooth;
  
  /* Consistent background for overscroll areas */
  background-color: var(--color-base-100);
  
  /* Full height to enable proper scrolling */
  height: 100%;
}

body {
  /* Inherit overflow rules from html */
  overflow-x: hidden;
  overflow-y: auto;
  
  /* Remove default margins that could cause issues */
  margin: 0;
  padding: 0;
  width: 100%;
  max-width: 100vw;
  min-height: 100vh;
  
  /* Consistent background color */
  background-color: var(--color-base-100);
}

/* Overscroll behavior for modern browsers */
html, body {
  /* Completely prevent horizontal overscroll */
  overscroll-behavior-x: none;
  
  /* Allow vertical overscroll but contain it */
  overscroll-behavior-y: contain;
}

/* Main content wrapper - automatically applied via root.html.heex */
.app-scroll-container {
  width: 100vw;
  max-width: 100vw;
  min-height: 100vh;
  overflow-x: hidden;
  overflow-y: auto;
  
  /* Enable snap scrolling (proximity = optional snap points) */
  scroll-snap-type: y proximity;
}

/* Make sections snap-ready (developers just need to add the class) */
.snap-section {
  scroll-snap-align: start;
  min-height: 100vh;
  width: 100%;
  overflow-x: hidden;
}

/* Prevent common horizontal overflow causes */
img, video, iframe, embed, object, svg, canvas {
  max-width: 100%;
  height: auto;
  display: block; /* Removes inline spacing issues */
}

/* Tables need special handling for responsiveness */
table {
  display: block;
  max-width: 100%;
  overflow-x: auto; /* Allow horizontal scroll within table only */
  -webkit-overflow-scrolling: touch; /* Smooth scrolling on iOS */
}

/* Code blocks should wrap or scroll within their container */
pre, code {
  max-width: 100%;
  overflow-x: auto;
  word-wrap: break-word;
  white-space: pre-wrap;
}

/* Responsive flex/grid defaults */
.flex {
  flex-wrap: wrap; /* Automatically wrap flex items */
}

.grid {
  /* Responsive grid that adjusts column count automatically */
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 250px), 1fr));
}

/* LiveView specific containers - maintain layout transparency */
[data-phx-main], 
[data-phx-session], 
[data-phx-static],
[data-phx-parent-id] {
  max-width: 100vw;
  overflow-x: hidden;
  display: contents; /* Makes these wrappers "invisible" to layout */
}

/* Ensure all semantic HTML elements respect boundaries */
main, article, section, aside, nav, header, footer {
  max-width: 100%;
  overflow-x: hidden;
}
```

### Step 2: Root HTML Structure (root.html.heex)

Replace the entire content of `lib/demostarter_web/components/layouts/root.html.heex` with:

```heex
<!DOCTYPE html>
<html lang="en">
  <head>
    {Application.get_env(:live_debugger, :live_debugger_tags)}

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="csrf-token" content={get_csrf_token()} />
    <.live_title default="Demostarter" suffix=" · Phoenix Framework">
      {assigns[:page_title]}
    </.live_title>
    <link phx-track-static rel="stylesheet" href={~p"/assets/css/app.css"} />
    <script defer phx-track-static type="text/javascript" src={~p"/assets/js/app.js"}>
    </script>
    <script>
      (() => {
        const setTheme = (theme) => {
          if (theme === "system") {
            localStorage.removeItem("phx:theme");
            document.documentElement.removeAttribute("data-theme");
          } else {
            localStorage.setItem("phx:theme", theme);
            document.documentElement.setAttribute("data-theme", theme);
          }
        };
        if (!document.documentElement.hasAttribute("data-theme")) {
          setTheme(localStorage.getItem("phx:theme") || "system");
        }
        window.addEventListener("storage", (e) => e.key === "phx:theme" && setTheme(e.newValue || "system"));
        window.addEventListener("phx:set-theme", ({ detail: { theme } }) => setTheme(theme));
      })();
    </script>
  </head>
  <body>
    <div class="app-scroll-container" id="app-root">
      {@inner_content}
    </div>
    
    <script>
      // Failsafe: Prevent any horizontal scrolling
      (function() {
        // Reset horizontal scroll if it somehow occurs
        let preventHorizontal = function() {
          if (window.scrollX !== 0) {
            window.scrollTo(0, window.scrollY);
          }
        };
        
        // Monitor scroll events
        window.addEventListener('scroll', preventHorizontal, { passive: true });
        window.addEventListener('load', preventHorizontal);
        
        // Prevent horizontal swipe on touch devices
        let touchStartX = 0;
        let touchStartY = 0;
        
        document.addEventListener('touchstart', function(e) {
          touchStartX = e.touches[0].clientX;
          touchStartY = e.touches[0].clientY;
        }, { passive: true });
        
        document.addEventListener('touchmove', function(e) {
          let touchEndX = e.touches[0].clientX;
          let touchEndY = e.touches[0].clientY;
          let diffX = Math.abs(touchStartX - touchEndX);
          let diffY = Math.abs(touchStartY - touchEndY);
          
          // If horizontal movement is greater than vertical, prevent it
          if (diffX > diffY && diffX > 10) {
            e.preventDefault();
          }
        }, { passive: false });
      })();
    </script>
  </body>
</html>
```

## Usage Guide

### Basic Usage (Automatic)

Once implemented, every new page automatically has all protections:

```elixir
# LiveView example
defmodule MyAppWeb.SomeLive do
  use MyAppWeb, :live_view
  
  def render(assigns) do
    ~H"""
    <div>
      <h1>This page automatically has no horizontal scroll!</h1>
      <p>Content will responsively stack on mobile.</p>
    </div>
    """
  end
end
```

```elixir
# Controller example
defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller
  
  def index(conn, _params) do
    # The rendered template automatically inherits all behaviors
    render(conn, :index)
  end
end
```

### Optional Snap Scrolling

To enable page-by-page scrolling, just add the `.snap-section` class:

```heex
<div class="snap-section">
  <h1>First Screen</h1>
  <p>This takes up the full viewport height</p>
</div>

<div class="snap-section">
  <h1>Second Screen</h1>
  <p>Scroll snaps to this section</p>
</div>

<div class="snap-section">
  <h1>Third Screen</h1>
  <p>And this one too!</p>
</div>
```

### Responsive Grids (Automatic)

Grids automatically become responsive:

```heex
<div class="grid gap-4">
  <div class="bg-base-200 p-4">Item 1</div>
  <div class="bg-base-200 p-4">Item 2</div>
  <div class="bg-base-200 p-4">Item 3</div>
  <div class="bg-base-200 p-4">Item 4</div>
</div>
```

### Flex Layouts (Automatic Wrapping)

Flexbox layouts automatically wrap:

```heex
<div class="flex gap-4">
  <div class="bg-primary text-primary-content p-4">Flex Item 1</div>
  <div class="bg-secondary text-secondary-content p-4">Flex Item 2</div>
  <div class="bg-accent text-accent-content p-4">Flex Item 3</div>
</div>
```

## How It Works

### Inheritance Chain

1. **root.html.heex** wraps ALL content in `.app-scroll-container`
2. **app.css** applies global rules to ALL elements
3. **JavaScript failsafe** prevents any edge cases
4. **LiveView's rendering** ensures this applies to all navigation

### Technical Details

- **CSS Specificity**: Global rules use low specificity so they can be overridden if needed
- **Performance**: Uses `display: contents` for LiveView wrappers to maintain layout performance
- **Browser Support**: Works in all modern browsers, with fallbacks for older ones
- **Touch Devices**: Special handling for touch events to prevent horizontal swipes

## Customization

### Changing Background Colors

If not using DaisyUI, replace `var(--color-base-100)` with your color:

```css
html, body {
  background-color: #ffffff; /* or your preferred color */
}
```

### Adjusting Snap Behavior

Change from `proximity` to `mandatory` for required snapping:

```css
.app-scroll-container {
  scroll-snap-type: y mandatory; /* Forces snap points */
}
```

### Custom Breakpoints

Override the grid behavior with custom breakpoints:

```css
@media (min-width: 640px) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

## Portability to Other Projects

To use this in other Phoenix projects:

1. Copy the CSS rules from Step 1 to the new project's CSS file
2. Copy the root.html.heex structure from Step 2
3. If not using DaisyUI, replace CSS variables with actual colors
4. If not using Tailwind, extract just the layout-specific rules

The system is self-contained in these two files, making it highly portable.

## Troubleshooting

### Content Still Overflows Horizontally

Check for:
- Fixed widths in pixels (use percentages or `max-width` instead)
- Elements with `white-space: nowrap`
- Third-party components with their own overflow rules

### Snap Scrolling Not Working

Ensure:
- Parent container has defined height (`100vh`)
- Child sections have `min-height: 100vh`
- No conflicting `scroll-snap-type` rules

### Background Color Not Extending

Verify:
- CSS variables are defined (for DaisyUI themes)
- No other rules overriding the background color
- Both `html` and `body` have the background color set

## Notes

- This system prioritizes preventing horizontal scroll over all else
- Tables can still scroll horizontally within their container (by design)
- The JavaScript failsafe is lightweight and won't impact performance
- All features degrade gracefully if JavaScript is disabled (CSS handles most cases)