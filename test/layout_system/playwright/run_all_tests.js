// Unified test runner for Phoenix LiveView Layout System
// This script runs all tests using Playwright MCP tools

const BASE_URL = 'http://localhost:4000';

// Test results collector
const results = {
  passed: 0,
  failed: 0,
  tests: []
};

// Helper function to add test result
function addResult(testName, status, details = '') {
  results.tests.push({ testName, status, details });
  if (status === 'passed') {
    results.passed++;
  } else {
    results.failed++;
  }
  console.log(`${status === 'passed' ? '✅' : '❌'} ${testName}: ${status}`);
  if (details) {
    console.log(`   Details: ${details}`);
  }
}

// Test 1: Basic Layout Tests
async function testBasicLayout() {
  console.log('\n=== Running Basic Layout Tests ===');
  
  try {
    // Test at desktop viewport
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/basic`,
      width: 1440,
      height: 900,
      browserType: 'chromium',
      headless: true
    });
    
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Check for horizontal scroll
    const desktopCheck = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          scrollX: window.scrollX,
          bodyOverflowX: window.getComputedStyle(document.body).overflowX,
          containerExists: !!document.querySelector('.app-scroll-container')
        };
      `
    });
    
    if (!desktopCheck.hasHorizontalScroll && desktopCheck.scrollX === 0 && desktopCheck.containerExists) {
      addResult('Basic Layout - Desktop (1440px)', 'passed', JSON.stringify(desktopCheck));
    } else {
      addResult('Basic Layout - Desktop (1440px)', 'failed', JSON.stringify(desktopCheck));
    }
    
    // Test at mobile viewport
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/basic`,
      width: 375,
      height: 667,
      browserType: 'chromium',
      headless: true
    });
    
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    const mobileCheck = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          scrollX: window.scrollX,
          flexWrap: window.getComputedStyle(document.querySelector('.flex')).flexWrap
        };
      `
    });
    
    if (!mobileCheck.hasHorizontalScroll && mobileCheck.flexWrap === 'wrap') {
      addResult('Basic Layout - Mobile (375px)', 'passed', JSON.stringify(mobileCheck));
    } else {
      addResult('Basic Layout - Mobile (375px)', 'failed', JSON.stringify(mobileCheck));
    }
    
  } catch (error) {
    addResult('Basic Layout Tests', 'failed', error.message);
  }
}

// Test 2: Snap Scrolling Tests
async function testSnapScrolling() {
  console.log('\n=== Running Snap Scrolling Tests ===');
  
  try {
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/snap`,
      width: 1280,
      height: 800,
      browserType: 'chromium',
      headless: true
    });
    
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Check snap container properties
    const snapCheck = await mcp__playwright__playwright_evaluate({
      script: `
        const container = document.querySelector('.snap-container');
        const section = document.querySelector('.snap-section');
        return {
          hasSnapContainer: !!container,
          snapType: container ? window.getComputedStyle(container).scrollSnapType : 'none',
          sectionHeight: section ? section.offsetHeight : 0,
          viewportHeight: window.innerHeight,
          sectionSnapAlign: section ? window.getComputedStyle(section).scrollSnapAlign : 'none',
          sectionSnapStop: section ? window.getComputedStyle(section).scrollSnapStop : 'none'
        };
      `
    });
    
    if (snapCheck.hasSnapContainer && 
        snapCheck.snapType.includes('mandatory') && 
        snapCheck.sectionSnapAlign === 'start' &&
        snapCheck.sectionSnapStop === 'always') {
      addResult('Snap Scrolling - Container Setup', 'passed', JSON.stringify(snapCheck));
    } else {
      addResult('Snap Scrolling - Container Setup', 'failed', JSON.stringify(snapCheck));
    }
    
    // Test actual scrolling behavior
    await mcp__playwright__playwright_evaluate({
      script: 'window.scrollTo(0, window.innerHeight * 1.5);'
    });
    
    await new Promise(resolve => setTimeout(resolve, 500));
    
    const scrollPosition = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          scrollY: window.scrollY,
          expectedY: window.innerHeight,
          isSnapped: Math.abs(window.scrollY - window.innerHeight) < 5
        };
      `
    });
    
    if (scrollPosition.isSnapped) {
      addResult('Snap Scrolling - Scroll Behavior', 'passed', 'Correctly snapped to section 2');
    } else {
      addResult('Snap Scrolling - Scroll Behavior', 'failed', JSON.stringify(scrollPosition));
    }
    
  } catch (error) {
    addResult('Snap Scrolling Tests', 'failed', error.message);
  }
}

// Test 3: Stress Tests
async function testStressTests() {
  console.log('\n=== Running Stress Tests ===');
  
  try {
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/stress`,
      width: 1024,
      height: 768,
      browserType: 'chromium',
      headless: true
    });
    
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Check handling of various edge cases
    const stressCheck = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          longTextHandling: window.getComputedStyle(document.querySelector('.bg-warning')).overflowWrap,
          tableOverflow: window.getComputedStyle(document.querySelector('table').parentElement).overflowX,
          fixedWidthElements: document.querySelectorAll('[style*="width:"]').length,
          svgHandling: !!document.querySelector('svg[viewBox="0 0 2000 400"]')
        };
      `
    });
    
    if (!stressCheck.hasHorizontalScroll && 
        stressCheck.tableOverflow === 'auto' &&
        stressCheck.fixedWidthElements > 0) {
      addResult('Stress Tests - Edge Cases', 'passed', JSON.stringify(stressCheck));
    } else {
      addResult('Stress Tests - Edge Cases', 'failed', JSON.stringify(stressCheck));
    }
    
  } catch (error) {
    addResult('Stress Tests', 'failed', error.message);
  }
}

// Test 4: Dynamic Content / LiveView Tests
async function testDynamicContent() {
  console.log('\n=== Running Dynamic Content Tests ===');
  
  try {
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/dynamic`,
      width: 1280,
      height: 800,
      browserType: 'chromium',
      headless: true
    });
    
    await new Promise(resolve => setTimeout(resolve, 2000)); // Wait for LiveView
    
    // Test initial state
    const initialCheck = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth,
          hasLiveViewElements: !!document.querySelector('[phx-click]'),
          itemCount: document.querySelectorAll('[phx-click="remove_item"]').length
        };
      `
    });
    
    if (!initialCheck.hasHorizontalScroll && initialCheck.hasLiveViewElements) {
      addResult('Dynamic Content - Initial State', 'passed', JSON.stringify(initialCheck));
    } else {
      addResult('Dynamic Content - Initial State', 'failed', JSON.stringify(initialCheck));
    }
    
    // Test wide content toggle
    await mcp__playwright__playwright_click({ selector: 'button:has-text("Toggle Wide Content")' });
    await new Promise(resolve => setTimeout(resolve, 500));
    
    const wideContentCheck = await mcp__playwright__playwright_evaluate({
      script: `
        return {
          hasWideContent: !!document.querySelector('[style*="width: 2500px"]'),
          hasHorizontalScroll: document.documentElement.scrollWidth > document.documentElement.clientWidth
        };
      `
    });
    
    if (wideContentCheck.hasWideContent && !wideContentCheck.hasHorizontalScroll) {
      addResult('Dynamic Content - Wide Content Toggle', 'passed', 'Wide content contained properly');
    } else {
      addResult('Dynamic Content - Wide Content Toggle', 'failed', JSON.stringify(wideContentCheck));
    }
    
  } catch (error) {
    addResult('Dynamic Content Tests', 'failed', error.message);
  }
}

// Test 5: Touch Device Simulation
async function testTouchDevices() {
  console.log('\n=== Running Touch Device Tests ===');
  
  try {
    await mcp__playwright__playwright_navigate({
      url: `${BASE_URL}/test-layout/basic`,
      width: 375,
      height: 667,
      browserType: 'chromium',
      headless: true
    });
    
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    // Check touch prevention script exists
    const touchCheck = await mcp__playwright__playwright_evaluate({
      script: `
        const scripts = Array.from(document.scripts).map(s => s.textContent);
        const hasTouchPrevention = scripts.some(s => s.includes('touchstart') && s.includes('touchmove'));
        return {
          hasTouchPrevention,
          bodyOverscrollX: window.getComputedStyle(document.body).overscrollBehaviorX,
          htmlOverscrollX: window.getComputedStyle(document.documentElement).overscrollBehaviorX
        };
      `
    });
    
    if (touchCheck.hasTouchPrevention && touchCheck.bodyOverscrollX === 'none') {
      addResult('Touch Device - Horizontal Swipe Prevention', 'passed', JSON.stringify(touchCheck));
    } else {
      addResult('Touch Device - Horizontal Swipe Prevention', 'failed', JSON.stringify(touchCheck));
    }
    
  } catch (error) {
    addResult('Touch Device Tests', 'failed', error.message);
  }
}

// Main test runner
async function runAllTests() {
  console.log('🚀 Starting Phoenix LiveView Layout System Tests\n');
  console.log(`Testing against: ${BASE_URL}`);
  console.log('=' .repeat(50));
  
  try {
    await testBasicLayout();
    await testSnapScrolling();
    await testStressTests();
    await testDynamicContent();
    await testTouchDevices();
    
    // Close browser
    await mcp__playwright__playwright_close();
    
    // Print summary
    console.log('\n' + '=' .repeat(50));
    console.log('📊 Test Summary:');
    console.log(`✅ Passed: ${results.passed}`);
    console.log(`❌ Failed: ${results.failed}`);
    console.log(`📝 Total: ${results.tests.length}`);
    
    if (results.failed > 0) {
      console.log('\n❌ Failed Tests:');
      results.tests
        .filter(t => t.status === 'failed')
        .forEach(t => console.log(`  - ${t.testName}: ${t.details}`));
    }
    
    // Exit with appropriate code
    process.exit(results.failed > 0 ? 1 : 0);
    
  } catch (error) {
    console.error('\n💥 Test runner error:', error);
    process.exit(1);
  }
}

// Run the tests
runAllTests().catch(console.error);