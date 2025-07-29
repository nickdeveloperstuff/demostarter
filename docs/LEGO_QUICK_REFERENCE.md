# LEGO UI System Quick Reference

## Widget Sizes Visual Guide

```
1x1  2x1    3x1      4x1        6x1              12x1
┌─┐  ┌──┐   ┌───┐    ┌────┐     ┌──────┐         ┌────────────┐
│ │  │  │   │   │    │    │     │      │         │            │
└─┘  └──┘   └───┘    └────┘     └──────┘         └────────────┘

2x2  3x2    4x2      6x2        12x2
┌──┐ ┌───┐  ┌────┐   ┌──────┐   ┌────────────┐
│  │ │   │  │    │   │      │   │            │
│  │ │   │  │    │   │      │   │            │
└──┘ └───┘  └────┘   └──────┘   └────────────┘
```

## Component Structure

```heex
<!-- Basic Widget -->
<.lego_widget size="2x1" title="Title">
  Content
</.lego_widget>

<!-- Widget with Actions -->
<.lego_widget size="4x2" title="Chart">
  <:actions>
    <button class="btn btn-xs">Export</button>
  </:actions>
  <canvas id="chart"></canvas>
  <:footer>
    Last updated: 5 min ago
  </:footer>
</.lego_widget>

<!-- Dashboard Layout -->
<.dashboard_layout title="Dashboard">
  <:metrics>
    <!-- Metric widgets -->
  </:metrics>
  <:charts>
    <!-- Chart widgets -->
  </:charts>
</.dashboard_layout>
```

## Spacing Units

- `--lego-unit`: 4px
- `--lego-unit-2`: 8px
- `--lego-unit-4`: 16px (standard gap)
- `--lego-unit-6`: 24px
- `--lego-unit-8`: 32px

## Responsive Behavior

- **Mobile (<768px)**: All widgets stack to full width
- **Tablet (768-1024px)**: 6-column grid
- **Desktop (>1024px)**: Full 12-column grid

## DaisyUI Integration

Use DaisyUI components inside LEGO widgets:
- Buttons: `btn`, `btn-primary`, etc.
- Forms: `input`, `select`, `checkbox`
- Feedback: `alert`, `toast`, `modal`
- Data: `table`, `stat`, `badge`