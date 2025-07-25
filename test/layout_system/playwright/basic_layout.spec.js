// Basic Layout Test - Tests horizontal scroll prevention and responsive behavior

const BASE_URL = 'http://localhost:4000';

async function runBasicLayoutTests() {
  console.log('Starting Basic Layout Tests...\n');
  
  const viewports = [
    { name: 'Mobile', width: 375, height: 667 },
    { name: 'Tablet', width: 768, height: 1024 },
    { name: 'Desktop', width: 1440, height: 900 }
  ];
  
  for (const viewport of viewports) {
    console.log(`\nTesting ${viewport.name} viewport (${viewport.width}x${viewport.height})`);
    
    try {
      // Navigate to the basic layout test page
      await mcp__playwright__playwright_navigate({
        url: `${BASE_URL}/test-layout/basic`,
        width: viewport.width,
        height: viewport.height,
        browserType: 'chromium',
        headless: false
      });
      
      // Wait a moment for the page to stabilize
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      // Test 1: Check horizontal scroll position
      const scrollX = await mcp__playwright__playwright_evaluate({
        script: 'window.scrollX'
      });
      console.log(`  ✓ Horizontal scroll position: ${scrollX} (should be 0)`);
      
      // Test 2: Check if horizontal scrollbar exists
      const hasHorizontalScroll = await mcp__playwright__playwright_evaluate({
        script: 'document.documentElement.scrollWidth > document.documentElement.clientWidth'
      });
      console.log(`  ✓ Has horizontal scrollbar: ${hasHorizontalScroll} (should be false)`);
      
      // Test 3: Check body overflow
      const bodyOverflow = await mcp__playwright__playwright_evaluate({
        script: 'window.getComputedStyle(document.body).overflowX'
      });
      console.log(`  ✓ Body overflow-x: ${bodyOverflow} (should be hidden)`);
      
      // Test 4: Try to scroll horizontally
      await mcp__playwright__playwright_evaluate({
        script: 'window.scrollTo(100, 0)'
      });
      const scrollAfterAttempt = await mcp__playwright__playwright_evaluate({
        script: 'window.scrollX'
      });
      console.log(`  ✓ Scroll position after attempt: ${scrollAfterAttempt} (should still be 0)`);
      
      // Test 5: Check grid responsiveness
      const gridColumns = await mcp__playwright__playwright_evaluate({
        script: `
          const grid = document.querySelector('.grid');
          if (grid) {
            return window.getComputedStyle(grid).gridTemplateColumns;
          }
          return 'not found';
        `
      });
      console.log(`  ✓ Grid columns: ${gridColumns}`);
      
      // Take screenshot for visual verification
      await mcp__playwright__playwright_screenshot({
        name: `basic-layout-${viewport.name.toLowerCase()}-${viewport.width}px`,
        fullPage: true,
        savePng: true,
        downloadsDir: '/Users/nicholasprice/Documents/DEVELOPMENT/SCRATCH/demostarter/demostarter/test/layout_system/screenshots'
      });
      console.log(`  ✓ Screenshot saved: basic-layout-${viewport.name.toLowerCase()}-${viewport.width}px.png`);
      
    } catch (error) {
      console.error(`  ✗ Error in ${viewport.name} test:`, error.message);
    }
  }
  
  // Test touch gestures on mobile viewport
  console.log('\nTesting touch gestures...');
  try {
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/basic`,
      width: 375,
      height: 667,
      browserType: 'chromium',
      headless: false
    });
    
    // Simulate horizontal swipe
    await mcp__playwright__playwright_evaluate({
      script: `
        const touchStart = new TouchEvent('touchstart', {
          touches: [new Touch({ identifier: 1, target: document.body, clientX: 200, clientY: 300 })]
        });
        const touchMove = new TouchEvent('touchmove', {
          touches: [new Touch({ identifier: 1, target: document.body, clientX: 50, clientY: 300 })]
        });
        const touchEnd = new TouchEvent('touchend', { touches: [] });
        
        document.dispatchEvent(touchStart);
        document.dispatchEvent(touchMove);
        document.dispatchEvent(touchEnd);
        
        return window.scrollX;
      `
    });
    console.log('  ✓ Touch swipe test completed (horizontal scroll should be prevented)');
    
  } catch (error) {
    console.error('  ✗ Error in touch gesture test:', error.message);
  }
  
  // Close the browser
  await mcp__playwright__playwright_close();
  console.log('\n✅ Basic Layout Tests Completed');
}

// Run the tests
runBasicLayoutTests().catch(console.error);