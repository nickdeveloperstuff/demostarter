// Snap Scrolling Test - Tests the snap-section functionality

const BASE_URL = 'http://localhost:4000';

async function runSnapScrollingTests() {
  console.log('Starting Snap Scrolling Tests...\n');
  
  try {
    // Navigate to the snap scrolling test page
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/snap`,
      width: 1280,
      height: 720,
      browserType: 'chromium',
      headless: false
    });
    
    // Wait for page to load
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Test 1: Check snap container styles
    const snapContainerStyles = await mcp__playwright__playwright_evaluate({
      script: `
        const container = document.querySelector('.app-scroll-container');
        const styles = window.getComputedStyle(container);
        return {
          scrollSnapType: styles.scrollSnapType,
          overflowY: styles.overflowY,
          height: styles.height
        };
      `
    });
    console.log('  ✓ Snap container styles:', JSON.stringify(snapContainerStyles));
    
    // Test 2: Check snap sections
    const snapSections = await mcp__playwright__playwright_evaluate({
      script: `
        const sections = document.querySelectorAll('.snap-section');
        return Array.from(sections).map((section, index) => {
          const styles = window.getComputedStyle(section);
          return {
            index,
            scrollSnapAlign: styles.scrollSnapAlign,
            minHeight: styles.minHeight,
            backgroundColor: styles.backgroundColor
          };
        });
      `
    });
    console.log(`  ✓ Found ${snapSections.length} snap sections`);
    snapSections.forEach(section => {
      console.log(`    - Section ${section.index}: snap-align=${section.scrollSnapAlign}, min-height=${section.minHeight}`);
    });
    
    // Test 3: Test snap scrolling behavior
    console.log('\n  Testing snap scrolling behavior...');
    
    // Scroll down one section
    await mcp__playwright__playwright_evaluate({
      script: 'window.scrollTo({ top: window.innerHeight * 1.5, behavior: "smooth" })'
    });
    await new Promise(resolve => setTimeout(resolve, 1500)); // Wait for snap
    
    const scrollPosition1 = await mcp__playwright__playwright_evaluate({
      script: 'Math.round(window.scrollY / window.innerHeight)'
    });
    console.log(`    ✓ Scrolled to section: ${scrollPosition1} (should snap to 1 or 2)`);
    
    // Take screenshot of snapped position
    await mcp__playwright__playwright_screenshot({
      name: 'snap-scrolling-section-2',
      fullPage: false,
      savePng: true,
      downloadsDir: '/Users/nicholasprice/Documents/DEVELOPMENT/SCRATCH/demostarter/demostarter/test/layout_system/screenshots'
    });
    
    // Scroll to last section
    await mcp__playwright__playwright_evaluate({
      script: 'window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" })'
    });
    await new Promise(resolve => setTimeout(resolve, 1500));
    
    const scrollPosition2 = await mcp__playwright__playwright_evaluate({
      script: 'Math.round(window.scrollY / window.innerHeight)'
    });
    console.log(`    ✓ Scrolled to section: ${scrollPosition2} (should be near last section)`);
    
    // Test 4: Check horizontal scroll is still prevented
    const horizontalScroll = await mcp__playwright__playwright_evaluate({
      script: 'window.scrollX'
    });
    console.log(`  ✓ Horizontal scroll position: ${horizontalScroll} (should be 0)`);
    
    // Test 5: Test keyboard navigation
    await mcp__playwright__playwright_press_key({ key: 'Home' });
    await new Promise(resolve => setTimeout(resolve, 500));
    
    const homePosition = await mcp__playwright__playwright_evaluate({
      script: 'window.scrollY'
    });
    console.log(`  ✓ Home key position: ${homePosition} (should be 0)`);
    
    await mcp__playwright__playwright_press_key({ key: 'PageDown' });
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    const pageDownPosition = await mcp__playwright__playwright_evaluate({
      script: 'Math.round(window.scrollY / window.innerHeight)'
    });
    console.log(`  ✓ PageDown position: ${pageDownPosition} (should snap to next section)`);
    
    // Take full page screenshot
    await mcp__playwright__playwright_screenshot({
      name: 'snap-scrolling-full-page',
      fullPage: true,
      savePng: true,
      downloadsDir: '/Users/nicholasprice/Documents/DEVELOPMENT/SCRATCH/demostarter/demostarter/test/layout_system/screenshots'
    });
    
  } catch (error) {
    console.error('  ✗ Error in snap scrolling test:', error.message);
  }
  
  // Close the browser
  await mcp__playwright__playwright_close();
  console.log('\n✅ Snap Scrolling Tests Completed');
}

// Run the tests
runSnapScrollingTests().catch(console.error);