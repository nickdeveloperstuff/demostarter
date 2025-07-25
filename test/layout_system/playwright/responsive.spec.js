// Responsive Test - Tests dynamic content and LiveView updates

const BASE_URL = 'http://localhost:4000';

async function runResponsiveTests() {
  console.log('Starting Responsive & Dynamic Content Tests...\n');
  
  try {
    // Navigate to the dynamic content test page
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/dynamic`,
      width: 1280,
      height: 800,
      browserType: 'chromium',
      headless: false
    });
    
    // Wait for LiveView to connect
    await new Promise(resolve => setTimeout(resolve, 2000));
    
    // Test 1: Initial state check
    console.log('  Testing initial state...');
    const initialState = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          scrollX: window.scrollX,
          itemCount: document.querySelectorAll('[phx-click="remove_item"]').length
        };
      `
    });
    console.log('    ✓ Initial state:', JSON.stringify(initialState));
    
    // Test 2: Add items dynamically
    console.log('\n  Testing dynamic item addition...');
    await mcp__playwright__playwright_click({ selector: 'button:has-text("Add Item")' });
    await new Promise(resolve => setTimeout(resolve, 500));
    
    await mcp__playwright__playwright_click({ selector: 'button:has-text("Add Item")' });
    await new Promise(resolve => setTimeout(resolve, 500));
    
    const afterAddState = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          scrollX: window.scrollX,
          itemCount: document.querySelectorAll('[phx-click="remove_item"]').length
        };
      `
    });
    console.log('    ✓ After adding items:', JSON.stringify(afterAddState));
    
    // Test 3: Toggle wide content
    console.log('\n  Testing wide content toggle...');
    await mcp__playwright__playwright_click({ selector: 'button:has-text("Toggle Wide Content")' });
    await new Promise(resolve => setTimeout(resolve, 500));
    
    const wideContentState = await mcp__playwright__playwright_evaluate({
      script: `
        const wideContent = document.querySelector('[style*="width: 2500px"]');
        return {
          hasWideContent: !!wideContent,
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          scrollX: window.scrollX,
          bodyOverflowX: window.getComputedStyle(document.body).overflowX
        };
      `
    });
    console.log('    ✓ Wide content state:', JSON.stringify(wideContentState));
    
    // Test 4: Change grid columns
    console.log('\n  Testing grid column changes...');
    const gridTests = ['1', '3', '4'];
    
    for (const columns of gridTests) {
      await mcp__playwright__playwright_select({ 
        selector: 'select[name="columns"]', 
        value: columns 
      });
      await new Promise(resolve => setTimeout(resolve, 500));
      
      const gridState = await mcp__playwright__playwright_evaluate({
        script: `
          const grid = document.querySelector('.grid');
          return {
            columns: '${columns}',
            hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
            gridTemplateColumns: grid ? window.getComputedStyle(grid).gridTemplateColumns : 'not found'
          };
        `
      });
      console.log(`    ✓ Grid with ${columns} columns:`, JSON.stringify(gridState));
    }
    
    // Test 5: Wait for auto-update and check
    console.log('\n  Testing auto-updates (waiting 3 seconds)...');
    const beforeAutoUpdate = await mcp__playwright__playwright_evaluate({
      script: 'document.querySelector(".font-bold").textContent'
    });
    
    await new Promise(resolve => setTimeout(resolve, 3500));
    
    const afterAutoUpdate = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          counter: document.querySelector(".font-bold").textContent,
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          itemCount: document.querySelectorAll('[phx-click="remove_item"]').length
        };
      `
    });
    console.log('    ✓ Before auto-update counter:', beforeAutoUpdate);
    console.log('    ✓ After auto-update:', JSON.stringify(afterAutoUpdate));
    
    // Test 6: Responsive behavior at different viewports
    console.log('\n  Testing responsive behavior...');
    const viewports = [
      { name: 'Mobile', width: 375, height: 667 },
      { name: 'Tablet', width: 768, height: 1024 },
      { name: 'Desktop', width: 1440, height: 900 }
    ];
    
    for (const viewport of viewports) {
      console.log(`\n  Testing ${viewport.name} (${viewport.width}x${viewport.height})...`);
      
      await mcp__playwright__playwright_navigate({
        url: `${BASE_URL}/test-layout/dynamic`,
        width: viewport.width,
        height: viewport.height,
        browserType: 'chromium',
        headless: false
      });
      
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      // Toggle wide content at this viewport
      await mcp__playwright__playwright_click({ selector: 'button:has-text("Toggle Wide Content")' });
      await new Promise(resolve => setTimeout(resolve, 500));
      
      const viewportState = await mcp__playwright__playwright_evaluate({
        script: `
          return {
            viewport: '${viewport.name}',
            width: ${viewport.width},
            hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
            scrollX: window.scrollX,
            flexWrap: window.getComputedStyle(document.querySelector('.flex')).flexWrap
          };
        `
      });
      console.log('    ✓ Viewport state:', JSON.stringify(viewportState));
      
      // Take screenshot
      await mcp__playwright__playwright_screenshot({
        name: `responsive-${viewport.name.toLowerCase()}-${viewport.width}px`,
        fullPage: true,
        savePng: true,
        downloadsDir: '/Users/nicholasprice/Documents/DEVELOPMENT/SCRATCH/demostarter/demostarter/test/layout_system/screenshots'
      });
    }
    
    // Test 7: Check console for any errors
    console.log('\n  Checking for console errors...');
    const consoleLogs = await mcp__playwright__playwright_console_logs({ type: 'error' });
    if (consoleLogs && consoleLogs.length > 0) {
      console.log('    ⚠️  Console errors found:', consoleLogs);
    } else {
      console.log('    ✓ No console errors');
    }
    
  } catch (error) {
    console.error('  ✗ Error in responsive test:', error.message);
  }
  
  // Close the browser
  await mcp__playwright__playwright_close();
  console.log('\n✅ Responsive Tests Completed');
}

// Run the tests
runResponsiveTests().catch(console.error);