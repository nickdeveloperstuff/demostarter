# UI Build Rules

## Purpose / Scope
Rules for planning or implementing **new UI features, pages, or component uses** in this project. Keep the UI layer "dumb," preserve global styling, and minimize change surface.

### Use this file when...
- Designing or modifying UI layouts, pages, features, or component compositions
- Deciding what components to use and how to arrange them
- You need spacing or layout guidance (Tailwind utilities only)

### If you need a deeper dive (not auto-imported):
- `/rulesforai/rules-uioverview.md` – Overall UI architecture and layout strategy
- `/rulesforai/rules-uicomponents.md` – Catalog of allowed UI components and usage notes

## Must / Should / May

### MUST
- **ONLY** use the UI components defined in `/rulesforai/rules-uicomponents.md` to draft ALL of your UI. No other components are permitted.
- Use Context7 to look up documentation and best practices for any component you invoke.
- Do the absolute bare minimum to achieve the goal: smallest diff, least architectural disturbance.
- Preserve existing layouts, grids, and structure. Modify only what is essential.
- Perform **all spacing** with Tailwind spacing/layout utilities *only*; never add plain CSS for spacing.
- Follow the project's spacing scale/types below!
- Keep the UI "dumb": do not add business logic, state machines, or domain rules in UI code.

### SHOULD
- Split large UI tasks into small, reviewable increments.

### MAY
- Use Tailwind utilities strictly for layout (grid, flex, spacing).
- Create lightweight view-only helpers, but never embed core logic.

### NEVER
- Touch `app.css` or alter any component styling classes—central styling lives there.
- Add new Tailwind classes directly to components for visual design (spacing/layout is the exception).
- Introduce new component types!

## Dependencies & Cross-References
- **Project-level styling:** `app.css` (single source of truth)
- **Component catalog:** `/rulesforai/rules-uicomponents.md`
- **UI architecture summary:** `/rulesforai/rules-uioverview.md`

---

# Spacing Guidelines

**ONLY USE TAILWIND FOR SPACING!**

## Base Unit (u)
**0.25rem (4px)**. Do not change this.

## Allowed Scale (multipliers of u)
`0` `0.5` `1` `1.5` `2` `3` `4` `6` `8` `12` `16`

## Tailwind Spacing Tokens

| Token | Value |
|-------|-------|
| 0 | 0 |
| 0.5 | 0.125rem (2px) |
| 1 | 0.25rem (4px) |
| 1.5 | 0.375rem (6px) |
| 2 | 0.5rem (8px) |
| 3 | 0.75rem (12px) |
| 4 | 1rem (16px) |
| 6 | 1.5rem (24px) |
| 8 | 2rem (32px) |
| 12 | 3rem (48px) |
| 16 | 4rem (64px) |

Use Tailwind padding/margin/gap utilities with these keys only (`p-1`, `px-2`, `gap-3`, `mt-6`, `space-y-8`, etc.). Disable or ignore everything else.

## What Each Spacing Step is For (Desktop Defaults)

| Step | Use Case |
|------|----------|
| **0.5u** | Very tight inner padding (icons inside a button) |
| **1u** | Label-to-input gap, icon-to-text gap |
| **1–1.5u** | Small gaps inside a component (stacked form rows, list items inside a card) |
| **2–3u** | Component internal padding (card body padding, modal content padding) |
| **3–4u** | Gap between sibling components (cards next to each other, stacked modules) |
| **6–8u** | Gap between major page sections or rows |
| **12–16u** | Page gutters and margins from viewport edges |

## Mobile Adjustment Rule
When under your first breakpoint, move each chosen desktop value down exactly one step (do not go below 1u).

**Example:** desktop section gap = 6u → mobile section gap = 4u

## Enforcement Rules

1. **Only use values on the scale.** No custom numbers.
2. **Respect the hierarchy:** inside-element spacing < between components < between sections < page edges
3. **Do not jump more than two steps** unless you have a clear, documented reason.
4. **If unsure,** choose the next larger step rather than inventing a fraction.
5. **Keep vertical rhythm:** spacing should align with typography (line-height should also be a multiple of u).
6. **For denser layouts** (mobile or data-heavy tables), reduce by one step instead of adding new sizes.

## Formula
`space = u × scale_value`

**Example:** `gap-4` means gap = 1rem (4u × 0.25rem)