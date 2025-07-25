const { chromium, devices } = require('@playwright/test');

(async () => {
  const browser = await chromium.launch({ headless: false });
  const context = await browser.newContext({
    ...devices['Pixel 5']
  });
  
  const page = await context.newPage();
  await page.goto('http://localhost:4000/test-layout/snap');
  
  // Wait for page to load
  await page.waitForLoadState('networkidle');
  
  // Get computed styles and device info
  const info = await page.evaluate(() => {
    const container = document.querySelector('.snap-container-wrapper');
    const styles = container ? window.getComputedStyle(container) : {};
    
    return {
      userAgent: navigator.userAgent,
      viewport: {
        width: window.innerWidth,
        height: window.innerHeight
      },
      mediaQueries: {
        maxWidth768: window.matchMedia('(max-width: 768px)').matches,
        hoverNone: window.matchMedia('(hover: none)').matches,
        pointerCoarse: window.matchMedia('(pointer: coarse)').matches,
        combined: window.matchMedia('(max-width: 768px) and (hover: none) and (pointer: coarse)').matches
      },
      scrollSnapType: styles.scrollSnapType,
      height: styles.height,
      overflow: styles.overflowY
    };
  });
  
  console.log('Mobile Debug Info:', JSON.stringify(info, null, 2));
  
  // Keep browser open for manual inspection
  await page.waitForTimeout(30000);
  await browser.close();
})();