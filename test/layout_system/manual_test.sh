#!/bin/bash

echo "=== Phoenix LiveView Layout System Manual Test ==="
echo
echo "Testing all layout test pages..."
echo

BASE_URL="http://localhost:4000/test-layout"

# Test 1: Basic Layout Page
echo "1. Testing Basic Layout Page..."
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/basic")
if [ "$response" = "200" ]; then
  echo "   ✓ Basic layout page loads successfully"
  
  # Check for app-scroll-container
  if curl -s "$BASE_URL/basic" | grep -q "app-scroll-container"; then
    echo "   ✓ app-scroll-container class is present"
  else
    echo "   ✗ app-scroll-container class is missing"
  fi
  
  # Check for wide content
  if curl -s "$BASE_URL/basic" | grep -q "2000px"; then
    echo "   ✓ Wide content test element is present"
  else
    echo "   ✗ Wide content test element is missing"
  fi
else
  echo "   ✗ Basic layout page failed to load (HTTP $response)"
fi
echo

# Test 2: Snap Scrolling Page
echo "2. Testing Snap Scrolling Page..."
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/snap")
if [ "$response" = "200" ]; then
  echo "   ✓ Snap scrolling page loads successfully"
  
  snap_count=$(curl -s "$BASE_URL/snap" | grep -c "snap-section")
  echo "   ✓ Found $snap_count snap-section elements"
else
  echo "   ✗ Snap scrolling page failed to load (HTTP $response)"
fi
echo

# Test 3: Stress Test Page
echo "3. Testing Stress Test Page..."
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/stress")
if [ "$response" = "200" ]; then
  echo "   ✓ Stress test page loads successfully"
  
  # Check for long unbreakable text
  if curl -s "$BASE_URL/stress" | grep -q "ThisIsAVeryLongUnbreakableWord"; then
    echo "   ✓ Long unbreakable text test is present"
  else
    echo "   ✗ Long unbreakable text test is missing"
  fi
  
  # Check for table
  if curl -s "$BASE_URL/stress" | grep -q "<table"; then
    echo "   ✓ Wide table test is present"
  else
    echo "   ✗ Wide table test is missing"
  fi
else
  echo "   ✗ Stress test page failed to load (HTTP $response)"
fi
echo

# Test 4: Dynamic Content Page
echo "4. Testing Dynamic Content Page..."
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/dynamic")
if [ "$response" = "200" ]; then
  echo "   ✓ Dynamic content page loads successfully"
  
  # Check for phx-click attributes (LiveView interactivity)
  if curl -s "$BASE_URL/dynamic" | grep -q "phx-click"; then
    echo "   ✓ LiveView interactive elements are present"
  else
    echo "   ✗ LiveView interactive elements are missing"
  fi
else
  echo "   ✗ Dynamic content page failed to load (HTTP $response)"
fi
echo

echo "=== Test Summary ==="
echo
echo "All test pages are now available at:"
echo "  - Basic Layout:    $BASE_URL/basic"
echo "  - Snap Scrolling:  $BASE_URL/snap"
echo "  - Stress Test:     $BASE_URL/stress"
echo "  - Dynamic Content: $BASE_URL/dynamic"
echo
echo "Please open these URLs in your browser to visually verify:"
echo "  1. No horizontal scrollbar appears"
echo "  2. Wide content is contained"
echo "  3. Snap scrolling works smoothly"
echo "  4. Dynamic updates maintain layout constraints"
echo
echo "To run the Playwright tests, first install dependencies:"
echo "  cd test/layout_system/playwright"
echo "  npm install @playwright/test"
echo "  npx playwright install"
echo "  npm test"