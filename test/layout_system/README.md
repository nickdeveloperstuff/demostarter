# Layout System Test Suite

This directory contains comprehensive tests for the Phoenix LiveView automatic layout system that prevents horizontal scrolling and enables responsive design.

## Overview

The test suite validates that the layout system implemented in:
- `assets/css/app.css` - Global CSS rules
- `lib/demostarter_web/components/layouts/root.html.heex` - Root HTML structure

Works correctly across all pages and scenarios.

## Test Structure

```
test/layout_system/
├── pages/                       # Phoenix LiveView test pages
│   ├── basic_layout_live.ex    # Tests basic layout features
│   ├── snap_scrolling_live.ex  # Tests snap scrolling functionality
│   ├── stress_test_live.ex     # Tests edge cases and stress scenarios
│   └── dynamic_content_live.ex # Tests LiveView dynamic updates
├── playwright/                  # Automated browser tests
│   ├── basic_layout.spec.js    # Basic layout tests
│   ├── snap_scrolling.spec.js  # Snap scrolling tests
│   ├── stress_test.spec.js     # Stress and edge case tests
│   └── responsive.spec.js      # Responsive and dynamic tests
└── screenshots/                 # Visual test results (generated)
```

## Running the Tests

### Prerequisites

1. **Phoenix server must be running** on http://localhost:4000
   ```bash
   mix phx.server
   ```

2. **Install test dependencies** (if needed):
   ```bash
   cd test/layout_system/playwright
   npm install
   ```

### Running All Tests

From the playwright directory:
```bash
npm test
```

### Running Individual Test Suites

```bash
# Basic layout tests
npm run test:basic

# Snap scrolling tests
npm run test:snap

# Stress tests
npm run test:stress

# Responsive tests
npm run test:responsive
```

### Manual Testing

You can also manually visit the test pages in your browser:

- **Basic Layout**: http://localhost:4000/test-layout/basic
- **Snap Scrolling**: http://localhost:4000/test-layout/snap
- **Stress Test**: http://localhost:4000/test-layout/stress
- **Dynamic Content**: http://localhost:4000/test-layout/dynamic

## Test Descriptions

### 1. Basic Layout Test (`basic_layout_live.ex`)

Tests fundamental layout features:
- Wide content (2000px) that should NOT cause horizontal scroll
- Responsive grid stacking
- Flex layout wrapping
- Vertical scrolling
- Large image handling

### 2. Snap Scrolling Test (`snap_scrolling_live.ex`)

Tests the optional snap-scrolling feature:
- Full-height sections with `snap-section` class
- Smooth page-by-page scrolling
- Scroll snap points
- Keyboard navigation (Home, PageDown)
- Maintains horizontal scroll prevention

### 3. Stress Test (`stress_test_live.ex`)

Tests edge cases that typically break layouts:
- Very long unbreakable text
- Wide tables (should scroll within container only)
- Pre-formatted code blocks
- Nested flex containers
- Fixed width elements (500px, 800px, 1200px)
- Large SVGs with 2000px viewBox
- Absolute positioned elements
- Embedded content simulation

### 4. Dynamic Content Test (`dynamic_content_live.ex`)

Tests LiveView features and dynamic updates:
- Adding/removing items dynamically
- Toggling wide content (2500px)
- Changing grid columns (1-4 columns)
- Auto-updating content (every 3 seconds)
- Responsive behavior at different viewports
- CSS animations

## Expected Test Results

All tests should confirm:

✅ **No horizontal scrollbar** appears at any viewport size (375px, 768px, 1440px, 1920px)
✅ **Background color** extends into overscroll areas
✅ **Content responsively stacks** on smaller screens
✅ **Snap scrolling** works when using snap-section class
✅ **Touch devices** cannot swipe horizontally
✅ **LiveView updates** maintain layout constraints
✅ **JavaScript failsafe** prevents any edge case scrolling

## Interpreting Results

### Console Output

Each test outputs detailed information:
```
✓ Horizontal scroll position: 0 (should be 0)
✓ Has horizontal scrollbar: false (should be false)
✓ Body overflow-x: hidden (should be hidden)
```

### Screenshots

Screenshots are saved to the `screenshots/` directory with descriptive names:
- `basic-layout-mobile-375px.png`
- `basic-layout-tablet-768px.png`
- `basic-layout-desktop-1440px.png`
- `snap-scrolling-section-2.png`
- `stress-test-mobile-375px.png`
- etc.

### Common Issues and Solutions

If tests fail, check:

1. **Server not running**: Ensure Phoenix server is running on port 4000
2. **Routes not found**: Check that router.ex includes the test routes
3. **Horizontal scroll detected**: Review app.css for missing rules
4. **JavaScript errors**: Check root.html.heex for failsafe script

## Porting to Other Projects

To use these tests in other Phoenix projects:

1. Copy the entire `/test/layout_system/` directory
2. Add the test routes to your router.ex:
   ```elixir
   scope "/test-layout", YourAppWeb.Test do
     pipe_through :browser
     
     live "/basic", BasicLayoutLive
     live "/snap", SnapScrollingLive
     live "/stress", StressTestLive
     live "/dynamic", DynamicContentLive
   end
   ```
3. Update the module names in the test files to match your app name
4. Run the tests to verify your layout implementation

## Notes

- Tests use Playwright MCP tools for browser automation
- All modifications during error fixing are limited to:
  - `assets/css/app.css`
  - `lib/demostarter_web/components/layouts/root.html.heex`
  - `lib/demostarter_web/router.ex`
- The test suite is self-contained and doesn't affect production code
- Visual regression testing via screenshots helps catch subtle issues