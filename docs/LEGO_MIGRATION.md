# LEGO UI System Migration Guide

## Overview
This guide helps migrate existing components to the LEGO UI system.

## Migration Steps

### 1. Replace Grid Layouts
**Before:**
```heex
<div class="grid grid-cols-3 gap-4">
  <div class="col-span-1">Content</div>
  <div class="col-span-2">Content</div>
</div>
```

**After:**
```heex
<.lego_container>
  <.lego_widget size="4x1" title="Title">Content</.lego_widget>
  <.lego_widget size="8x1" title="Title">Content</.lego_widget>
</.lego_container>
```

### 2. Update Spacing
- Replace `p-4` with widget padding (automatic)
- Replace `m-4` with `lego-space-4`
- Replace `gap-4` with LEGO container gaps (automatic)

### 3. Update Components
All components must be wrapped in `<.lego_widget>` with valid sizes.

### 4. Run Validation
```bash
mix lego.validate --strict
```