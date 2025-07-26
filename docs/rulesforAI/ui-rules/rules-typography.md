# Typography System Rules

## Core Principle
Typography is controlled CENTRALLY through app.css. All font families, sizes, and hierarchies are defined as CSS variables and applied through utility classes.

## Font Families
- Sans: Use `font-sans` class or `var(--font-sans)`
- Mono: Use `font-mono` class or `var(--font-mono)`
- Serif: Use `font-serif` class or `var(--font-serif)`

## Font Sizes
Use semantic size classes:
- `text-xs` - 12px - Small labels, helper text
- `text-sm` - 14px - Secondary text, captions
- `text-base` - 16px - Body text (default)
- `text-lg` - 18px - Emphasized body text
- `text-xl` - 20px - Small headings
- `text-2xl` - 24px - H3 headings
- `text-3xl` - 30px - H2 headings
- `text-4xl` - 36px - H1 headings

## Typography Hierarchy
Minimum 3 levels required with 6-8px differences:
- H1: 36px, line-height 1.2, bold
- H2: 30px, line-height 1.3, semibold
- H3: 24px, line-height 1.4, semibold
- Body: 16px, line-height 1.6, normal
- Small: 14px, line-height 1.5, normal

## Usage
- Headers automatically get proper spacing
- Use semantic HTML tags (h1, h2, h3, p)
- Or use utility classes (.h1, .h2, .h3)

## Implementation Pattern
```heex
<!-- Using semantic HTML (preferred) -->
<h1>Main Heading</h1>
<h2>Section Heading</h2>
<h3>Subsection</h3>
<p>Body text with automatic spacing and line height.</p>

<!-- Using utility classes -->
<div class="h1">Main Heading Style</div>
<p class="text-lg">Larger body text</p>
<p class="text-sm text-muted-foreground">Secondary text</p>

<!-- With font families -->
<p class="font-sans">Default sans-serif text (Inter)</p>
<code class="font-mono text-sm">Monospace code (JetBrains Mono)</code>
<blockquote class="font-serif">Serif quote text (Merriweather)</blockquote>
```

## DaisyUI Integration
Typography utilities ENHANCE DaisyUI components:
```heex
<!-- DaisyUI card with typography -->
<div class="card">
  <div class="card-body">
    <h2 class="card-title text-2xl">Enhanced Card Title</h2>
    <p class="text-base">Card content with proper line height.</p>
  </div>
</div>
```

## NEVER
- Write custom font CSS
- Override typography variables outside app.css
- Use pixel values directly
- Skip the hierarchy rules

## Key Benefits
- Google Fonts load automatically via root.html.heex
- All sizes defined once in app.css
- Consistent hierarchy throughout the app
- Works seamlessly with DaisyUI components