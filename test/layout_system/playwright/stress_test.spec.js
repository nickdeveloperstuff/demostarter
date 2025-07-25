// Stress Test - Tests edge cases that typically cause horizontal overflow

const BASE_URL = 'http://localhost:4000';

async function runStressTests() {
  console.log('Starting Stress Tests (Edge Cases)...\n');
  
  try {
    // Navigate to the stress test page
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/stress`,
      width: 1024,
      height: 768,
      browserType: 'chromium',
      headless: false
    });
    
    // Wait for page to load
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Test 1: Check handling of long unbreakable text
    console.log('  Testing long unbreakable text...');
    const textOverflow = await mcp__playwright__playwright_evaluate({
      script: `
        const warningBox = document.querySelector('.bg-warning');
        const styles = window.getComputedStyle(warningBox);
        return {
          overflow: styles.overflow,
          overflowWrap: styles.overflowWrap,
          wordBreak: styles.wordBreak,
          width: warningBox.scrollWidth,
          clientWidth: warningBox.clientWidth
        };
      `
    });
    console.log('    ✓ Text overflow handling:', JSON.stringify(textOverflow));
    
    // Test 2: Check table scroll behavior
    console.log('\n  Testing wide table...');
    const tableContainer = await mcp__playwright__playwright_evaluate({
      script: `
        const table = document.querySelector('table');
        const container = table.parentElement;
        return {
          tableWidth: table.scrollWidth,
          containerWidth: container.clientWidth,
          hasHorizontalScroll: table.scrollWidth > container.clientWidth,
          containerOverflow: window.getComputedStyle(container).overflowX
        };
      `
    });
    console.log('    ✓ Table container:', JSON.stringify(tableContainer));
    
    // Test 3: Check pre/code block handling
    console.log('\n  Testing code block...');
    const codeBlock = await mcp__playwright__playwright_evaluate({
      script: `
        const pre = document.querySelector('pre');
        const styles = window.getComputedStyle(pre);
        return {
          overflow: styles.overflowX,
          whiteSpace: styles.whiteSpace,
          width: pre.scrollWidth,
          clientWidth: pre.clientWidth
        };
      `
    });
    console.log('    ✓ Code block styles:', JSON.stringify(codeBlock));
    
    // Test 4: Check fixed width elements
    console.log('\n  Testing fixed width elements...');
    const fixedWidthElements = await mcp__playwright__playwright_evaluate({
      script: `
        const elements = document.querySelectorAll('[style*="width:"]');
        return Array.from(elements).map(el => {
          const rect = el.getBoundingClientRect();
          return {
            specifiedWidth: el.style.width,
            actualWidth: rect.width,
            isVisible: rect.right <= window.innerWidth,
            overflow: window.getComputedStyle(el).overflow
          };
        });
      `
    });
    console.log(`    ✓ Found ${fixedWidthElements.length} fixed width elements`);
    fixedWidthElements.forEach((el, i) => {
      console.log(`      - Element ${i}: specified=${el.specifiedWidth}, actual=${el.actualWidth}px, visible=${el.isVisible}`);
    });
    
    // Test 5: Overall page scroll check
    console.log('\n  Final scroll checks...');
    const pageScroll = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          bodyScrollWidth: document.body.scrollWidth,
          bodyClientWidth: document.body.clientWidth,
          htmlScrollWidth: document.documentElement.scrollWidth,
          htmlClientWidth: document.documentElement.clientWidth,
          windowScrollX: window.scrollX,
          hasHorizontalScrollbar: document.documentElement.scrollWidth > document.documentElement.clientWidth
        };
      `
    });
    console.log('    ✓ Page scroll state:', JSON.stringify(pageScroll));
    
    // Test different viewports
    const viewports = [
      { name: 'Mobile', width: 375 },
      { name: 'Tablet', width: 768 },
      { name: 'Wide', width: 1920 }
    ];
    
    for (const viewport of viewports) {
      console.log(`\n  Testing ${viewport.name} viewport (${viewport.width}px)...`);
      
      await mcp__playwright__playwright_navigate({
        url: `${BASE_URL}/test-layout/stress`,
        width: viewport.width,
        height: 800,
        browserType: 'chromium',
        headless: false
      });
      
      await new Promise(resolve => setTimeout(resolve, 500));
      
      const scrollCheck = await mcp__playwright__playwright_evaluate({
        script: 'document.documentElement.scrollWidth > document.documentElement.clientWidth'
      });
      
      console.log(`    ✓ Has horizontal scroll: ${scrollCheck} (should be false)`);
      
      // Take screenshot
      await mcp__playwright__playwright_screenshot({
        name: `stress-test-${viewport.name.toLowerCase()}-${viewport.width}px`,
        fullPage: true,
        savePng: true,
        downloadsDir: '/Users/nicholasprice/Documents/DEVELOPMENT/SCRATCH/demostarter/demostarter/test/layout_system/screenshots'
      });
    }
    
  } catch (error) {
    console.error('  ✗ Error in stress test:', error.message);
  }
  
  // Close the browser
  await mcp__playwright__playwright_close();
  console.log('\n✅ Stress Tests Completed');
}

// Run the tests
runStressTests().catch(console.error);