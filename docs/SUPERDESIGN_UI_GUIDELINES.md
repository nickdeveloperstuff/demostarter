# SuperDesign UI Guidelines: The Complete Technical Specification

## Table of Contents
1. [Core Technologies & Versions](#core-technologies--versions)
2. [CSS Design System](#css-design-system)
3. [Typography System](#typography-system)
4. [Spacing & Layout System](#spacing--layout-system)
5. [Shadow System](#shadow-system)
6. [Animation & Micro-interactions](#animation--micro-interactions)
7. [Color System](#color-system)
8. [Component Patterns](#component-patterns)
9. [AI Workflow & Prompt Engineering](#ai-workflow--prompt-engineering)
10. [Implementation Examples](#implementation-examples)

---

## Core Technologies & Versions

### Required Libraries & CDNs

```html
<!-- Tailwind CSS - MUST use script tag, not link -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Flowbite Components (optional but recommended) -->
<script src="https://cdn.jsdelivr.net/npm/flowbite@2.0.0/dist/flowbite.min.js"></script>

<!-- Lucide Icons -->
<script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"></script>
```

### Font Loading

Always use Google Fonts with these specific font families:

```css
/* Primary font choices */
--font-sans: 'Inter', 'DM Sans', 'Plus Jakarta Sans', 'Outfit', 'Geist', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;

/* Monospace fonts */
--font-mono: 'JetBrains Mono', 'Fira Code', 'Source Code Pro', 'IBM Plex Mono', 'Roboto Mono', 'Space Mono', 'Geist Mono', monospace;

/* Serif fonts */
--font-serif: 'Merriweather', 'Playfair Display', 'Lora', 'Source Serif Pro', 'Libre Baskerville', Georgia, serif;

/* Display fonts */
--font-display: 'Space Grotesk', 'Oxanium', 'Architects Daughter', sans-serif;
```

---

## CSS Design System

### Complete CSS Variable Structure

Every SuperDesign theme MUST include these CSS custom properties:

```css
:root {
  /* Core Colors */
  --background: oklch(value);
  --foreground: oklch(value);
  
  /* Component Colors */
  --card: oklch(value);
  --card-foreground: oklch(value);
  --popover: oklch(value);
  --popover-foreground: oklch(value);
  
  /* Semantic Colors */
  --primary: oklch(value);
  --primary-foreground: oklch(value);
  --secondary: oklch(value);
  --secondary-foreground: oklch(value);
  --muted: oklch(value);
  --muted-foreground: oklch(value);
  --accent: oklch(value);
  --accent-foreground: oklch(value);
  --destructive: oklch(value);
  --destructive-foreground: oklch(value);
  
  /* UI Elements */
  --border: oklch(value);
  --input: oklch(value);
  --ring: oklch(value);
  
  /* Chart Colors */
  --chart-1: oklch(value);
  --chart-2: oklch(value);
  --chart-3: oklch(value);
  --chart-4: oklch(value);
  --chart-5: oklch(value);
  
  /* Sidebar Colors */
  --sidebar: oklch(value);
  --sidebar-foreground: oklch(value);
  --sidebar-primary: oklch(value);
  --sidebar-primary-foreground: oklch(value);
  --sidebar-accent: oklch(value);
  --sidebar-accent-foreground: oklch(value);
  --sidebar-border: oklch(value);
  --sidebar-ring: oklch(value);
  
  /* Spacing - CRITICAL: Must be 4pt/8pt system */
  --spacing: 0.25rem; /* Base: 4px */
  --spacing-xs: 0.25rem;  /* 4px */
  --spacing-sm: 0.5rem;   /* 8px */
  --spacing-md: 0.75rem;  /* 12px */
  --spacing-lg: 1rem;     /* 16px */
  --spacing-xl: 1.5rem;   /* 24px */
  --spacing-2xl: 2rem;    /* 32px */
  --spacing-3xl: 3rem;    /* 48px */
  
  /* Border Radius */
  --radius: 0.625rem;     /* 10px - base */
  --radius-sm: calc(var(--radius) - 4px);  /* 6px */
  --radius-md: calc(var(--radius) - 2px);  /* 8px */
  --radius-lg: var(--radius);              /* 10px */
  --radius-xl: calc(var(--radius) + 4px);  /* 14px */
  
  /* Typography */
  --font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  --font-sans: /* as defined above */;
  --font-serif: /* as defined above */;
  --font-mono: /* as defined above */;
  
  /* Font Sizes */
  --font-size-xs: 0.75rem;   /* 12px */
  --font-size-sm: 0.875rem;  /* 14px */
  --font-size-base: 1rem;    /* 16px */
  --font-size-lg: 1.125rem;  /* 18px */
  --font-size-xl: 1.25rem;   /* 20px */
  --font-size-2xl: 1.5rem;   /* 24px */
  --font-size-3xl: 1.875rem; /* 30px */
  --font-size-4xl: 2.25rem;  /* 36px */
  
  /* Shadows - See Shadow System section for values */
  --shadow-2xs: /* value */;
  --shadow-xs: /* value */;
  --shadow-sm: /* value */;
  --shadow: /* value */;
  --shadow-md: /* value */;
  --shadow-lg: /* value */;
  --shadow-xl: /* value */;
  --shadow-2xl: /* value */;
}
```

---

## Typography System

### Hierarchy Rules (STRICT)

1. **Minimum 3 levels required**: H1, H2, Body
2. **Size differences**: Minimum 6-8px between levels
3. **Modular scale example**:
   - H1: 36px (2.25rem)
   - H2: 28px (1.75rem)
   - H3: 24px (1.5rem)
   - Body: 16px (1rem) - MINIMUM
   - Small: 14px (0.875rem)

### Line Height Rules

```css
/* Typography rhythm */
h1 { line-height: 1.2; }  /* Tight for headlines */
h2 { line-height: 1.3; }
h3 { line-height: 1.4; }
p  { line-height: 1.6; }  /* Comfortable for reading */
small { line-height: 1.5; }
```

### Margin Spacing

```css
/* Consistent margin spacing */
h1 { margin-top: calc(1.2 * var(--spacing-2xl)); margin-bottom: var(--spacing-xl); }
h2 { margin-top: calc(1.2 * var(--spacing-xl)); margin-bottom: var(--spacing-lg); }
h3 { margin-top: calc(1.2 * var(--spacing-lg)); margin-bottom: var(--spacing-md); }
p  { margin-bottom: var(--spacing-md); }
```

---

## Spacing & Layout System

### The 4pt/8pt Grid System (MANDATORY)

ALL spacing must be multiples of 4px:

```css
/* ONLY these values are allowed */
4px   (0.25rem)  - --spacing-xs
8px   (0.5rem)   - --spacing-sm
12px  (0.75rem)  - --spacing-md
16px  (1rem)     - --spacing-lg
24px  (1.5rem)   - --spacing-xl
32px  (2rem)     - --spacing-2xl
48px  (3rem)     - --spacing-3xl

/* FORBIDDEN: 5px, 13px, 15px, 18px, etc. */
```

### Visual Grouping Rules

```css
/* Related items - tight spacing */
.form-label { margin-bottom: var(--spacing-xs); }  /* 4px */
.list-item + .list-item { margin-top: var(--spacing-sm); }  /* 8px */

/* Distinct groups - larger spacing */
.section + .section { margin-top: var(--spacing-xl); }  /* 24px */
.card + .card { margin-top: var(--spacing-lg); }  /* 16px */
```

### Touch Target Accessibility

```css
/* Minimum 48x48px touch targets */
.btn {
    min-height: 48px;
    min-width: 48px;
    padding: var(--spacing-sm) var(--spacing-lg);  /* 8px 16px */
}
```

---

## Shadow System

### Neo-Brutalism Style (90s Web Design)

```css
--shadow-2xs: 4px 4px 0px 0px hsl(0 0% 0% / 0.50);
--shadow-xs: 4px 4px 0px 0px hsl(0 0% 0% / 0.50);
--shadow-sm: 4px 4px 0px 0px hsl(0 0% 0% / 1.00), 4px 1px 2px -1px hsl(0 0% 0% / 1.00);
--shadow: 4px 4px 0px 0px hsl(0 0% 0% / 1.00), 4px 1px 2px -1px hsl(0 0% 0% / 1.00);
--shadow-md: 4px 4px 0px 0px hsl(0 0% 0% / 1.00), 4px 2px 4px -1px hsl(0 0% 0% / 1.00);
--shadow-lg: 4px 4px 0px 0px hsl(0 0% 0% / 1.00), 4px 4px 6px -1px hsl(0 0% 0% / 1.00);
--shadow-xl: 4px 4px 0px 0px hsl(0 0% 0% / 1.00), 4px 8px 10px -1px hsl(0 0% 0% / 1.00);
--shadow-2xl: 4px 4px 0px 0px hsl(0 0% 0% / 2.50);
```

### Modern Style (Vercel/Linear)

```css
--shadow-2xs: 0 1px 3px 0px hsl(0 0% 0% / 0.05);
--shadow-xs: 0 1px 3px 0px hsl(0 0% 0% / 0.05);
--shadow-sm: 0 1px 3px 0px hsl(0 0% 0% / 0.10), 0 1px 2px -1px hsl(0 0% 0% / 0.10);
--shadow: 0 1px 3px 0px hsl(0 0% 0% / 0.10), 0 1px 2px -1px hsl(0 0% 0% / 0.10);
--shadow-md: 0 1px 3px 0px hsl(0 0% 0% / 0.10), 0 2px 4px -1px hsl(0 0% 0% / 0.10);
--shadow-lg: 0 1px 3px 0px hsl(0 0% 0% / 0.10), 0 4px 6px -1px hsl(0 0% 0% / 0.10);
--shadow-xl: 0 1px 3px 0px hsl(0 0% 0% / 0.10), 0 8px 10px -1px hsl(0 0% 0% / 0.10);
--shadow-2xl: 0 1px 3px 0px hsl(0 0% 0% / 0.25);
```

---

## Animation & Micro-interactions

### Standard Transition Timing

```css
/* ALL transitions must use this timing */
transition: all 0.2s ease;

/* Specific property transitions */
transition: background-color 0.2s ease;
transition: transform 0.2s ease;
transition: opacity 0.2s ease;
transition: color 0.2s ease, background-color 0.2s ease;
```

### Hover State Patterns

```css
/* Cards */
.card {
    box-shadow: var(--shadow);
    transition: all 0.2s ease;
}
.card:hover {
    box-shadow: var(--shadow-lg);
    transform: translateY(-1px);
}

/* Buttons */
.btn {
    transition: all 0.2s;
}
.btn:hover {
    transform: scale(1.05);
    /* OR */
    transform: translateY(-1px);
}

/* Inputs */
.input {
    transition: all 0.2s;
}
.input:focus {
    box-shadow: 0 0 0 3px rgba(136, 136, 136, 0.5);
}
```

### Animation Examples from SuperDesign

```css
/* Message animations */
userMsg: 400ms ease-out [Y+20→0, X+10→0, S0.9→1]
aiMsg: 350ms ease-out [Y+15→0, α0→1]

/* UI element animations */
status: 300ms ease-out [α0.6→1, S1→1.05→1]
sidebar: 350ms ease-out [X-280→0, α0→1]
input: 200ms [S1→1.01, shadow+ring] focus
sendBtn: 200ms [S1→1.05, shadow↗] hover

/* Loading animations */
@keyframes pulse {
    0%, 100% { opacity: 0.4; transform: scale(0.8); }
    50% { opacity: 1; transform: scale(1.1); }
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
```

---

## Color System

### Color Philosophy

1. **60-30-10 Rule**:
   - 60% Background (white/light gray)
   - 30% Surface (white/medium gray)
   - 10% Accents (primary color/black)

2. **Minimal Palette**:
   - Default to black, white, and neutrals
   - One subtle accent color maximum
   - AVOID: Bootstrap blue, excessive gradients

3. **WCAG Contrast**:
   - Text vs background: ≥4.5:1 ratio
   - Large text: ≥3:1 ratio

### Modern Dark Mode Example (Vercel/Linear Style)

```css
:root {
  --background: oklch(1 0 0);           /* Pure white */
  --foreground: oklch(0.1450 0 0);      /* Near black */
  --primary: oklch(0.2050 0 0);         /* Dark gray */
  --primary-foreground: oklch(0.9850 0 0);
  --muted: oklch(0.9700 0 0);           /* Light gray */
  --muted-foreground: oklch(0.5560 0 0); /* Medium gray */
  --destructive: oklch(0.5770 0.2450 27.3250); /* Red */
}
```

### Neo-Brutalism Example

```css
:root {
  --background: oklch(1.0000 0 0);      /* White */
  --foreground: oklch(0 0 0);           /* Black */
  --primary: oklch(0.6489 0.2370 26.9728);     /* Orange */
  --secondary: oklch(0.9680 0.2110 109.7692);  /* Yellow */
  --accent: oklch(0.5635 0.2408 260.8178);     /* Purple */
  --border: oklch(0 0 0);               /* Black borders */
  --radius: 0px;                        /* No radius */
}
```

---

## Component Patterns

### Card Component

```css
.card {
    background-color: var(--card);
    color: var(--card-foreground);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: calc(var(--radius) + 4px);
    padding: var(--spacing-xl);
    box-shadow: var(--shadow);
    transition: all 0.2s ease;
}
```

### Button Variants

```css
.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: var(--spacing-sm);
    border-radius: var(--radius);
    font-size: var(--font-size-sm);
    font-weight: 500;
    transition: all 0.2s;
    padding: var(--spacing-sm) var(--spacing-lg);
    min-height: 2.25rem;
}

.btn-primary {
    background-color: var(--primary);
    color: var(--primary-foreground);
}

.btn-outline {
    background-color: transparent;
    border: 1px solid var(--border);
    color: var(--foreground);
}

.btn-ghost {
    background-color: transparent;
    color: var(--foreground);
}

.btn-destructive {
    background-color: var(--destructive);
    color: var(--destructive-foreground);
}
```

### Grid Layouts

```css
.grid-cols-1 { grid-template-columns: repeat(1, minmax(0, 1fr)); }
.grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
.grid-cols-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
.grid-cols-auto { grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); }

.gap-sm { gap: var(--spacing-sm); }
.gap-md { gap: var(--spacing-md); }
.gap-lg { gap: var(--spacing-lg); }
.gap-xl { gap: var(--spacing-xl); }
```

---

## AI Workflow & Prompt Engineering

### Workflow Structure

1. **Layout Design** → ASCII wireframe
2. **Theme Design** → generateTheme tool → CSS file
3. **Animation Design** → Micro-interactions plan
4. **HTML Generation** → Single file with all styles

### Key Prompt Instructions

```typescript
// From extension.ts
const systemPrompt = `
You are a senior front-end designer.
You pay close attention to every pixel, spacing, font, color;

# Workflow
1. Layout design
2. Theme design (Color, font, spacing, shadow), using generateTheme tool
3. Core Animation design
4. Generate a singlehtml file for the UI
5. You HAVE TO confirm with user step by step

# Rules
- ALWAYS spin up 3 parallel sub agents for variations
- Output to '.superdesign/design_iterations' folder
- Use naming: {design_name}_{n}.html
- Never include images (use CSS placeholders)
- Always responsive design
- Use Tailwind CSS via CDN
- Include !important for overrides
`;
```

### Theme Generation Tool

```typescript
// Tool expects these parameters:
{
  theme_name: string,
  reasoning_reference: string,
  cssSheet: string, // Full CSS with :root variables
  cssFilePath: string // e.g., '.superdesign/design_iterations/theme_1.css'
}
```

---

## Implementation Examples

### Complete HTML Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SuperDesign UI</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Theme CSS -->
    <link rel="stylesheet" href="theme_1.css">
    
    <style>
        /* Override Tailwind defaults */
        * {
            margin: 0 !important;
            padding: 0 !important;
            box-sizing: border-box !important;
        }
        
        body {
            font-family: var(--font-family) !important;
            background-color: var(--background) !important;
            color: var(--foreground) !important;
        }
    </style>
</head>
<body>
    <!-- Content here -->
</body>
</html>
```

### Responsive Container

```html
<div class="container">
    <!-- Max-width: 64rem (1024px) -->
    <!-- Padding: var(--spacing-2xl) var(--spacing-lg) -->
    <!-- Mobile: padding adjusts to var(--spacing-lg) var(--spacing-sm) -->
</div>
```

---

## Critical Rules Summary

1. **NEVER use arbitrary spacing** - Only 4pt/8pt multiples
2. **ALWAYS include all CSS variables** in :root
3. **Use transition: all 0.2s ease** for ALL animations
4. **Minimum 48x48px touch targets**
5. **Font size minimum 16px for body text**
6. **Use OKLCH color format**
7. **Follow 60-30-10 color ratio**
8. **Generate 3 variations by default**
9. **No images - CSS placeholders only**
10. **Responsive design is mandatory**

---

## File Structure

```
.superdesign/
├── design_iterations/
│   ├── {design_name}_1.html
│   ├── {design_name}_2.html
│   ├── {design_name}_3.html
│   └── theme_1.css
└── design_system/
    └── design-system.json
```

---

This guide represents the complete technical specification extracted from SuperDesign's implementation. Following these guidelines precisely will result in the same sleek, modern UI aesthetic that SuperDesign produces.