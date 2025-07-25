const { test, expect } = require('@playwright/test');

const BASE_URL = 'http://localhost:4000';

test.describe('Phoenix LiveView Layout System', () => {
  
  test.describe('Basic Layout Tests', () => {
    test('should prevent horizontal scrolling at desktop viewport', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/basic`);
      await page.waitForLoadState('networkidle');
      
      // Check for horizontal scroll
      const hasHorizontalScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      
      expect(hasHorizontalScroll).toBe(false);
      
      // Check app-scroll-container exists
      const container = await page.locator('.app-scroll-container');
      await expect(container).toBeVisible();
      
      // Check overflow properties
      const bodyOverflow = await page.evaluate(() => {
        return window.getComputedStyle(document.body).overflowX;
      });
      expect(bodyOverflow).toBe('hidden');
    });
    
    test('should prevent horizontal scrolling at mobile viewport', async ({ page }) => {
      await page.setViewportSize({ width: 375, height: 667 });
      await page.goto(`${BASE_URL}/test-layout/basic`);
      await page.waitForLoadState('networkidle');
      
      const hasHorizontalScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      
      expect(hasHorizontalScroll).toBe(false);
      
      // Check flex wrapping
      const flexWrap = await page.evaluate(() => {
        const flex = document.querySelector('.flex');
        return flex ? window.getComputedStyle(flex).flexWrap : null;
      });
      expect(flexWrap).toBe('wrap');
    });
    
    test('should contain 2000px wide content without horizontal scroll', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/basic`);
      
      // Check that wide content exists
      const wideContent = await page.locator('[style*="width: 2000px"]');
      await expect(wideContent).toBeVisible();
      
      // But no horizontal scroll
      const scrollX = await page.evaluate(() => window.scrollX);
      expect(scrollX).toBe(0);
      
      // Try to scroll horizontally
      await page.evaluate(() => window.scrollTo(100, 0));
      const scrollXAfter = await page.evaluate(() => window.scrollX);
      expect(scrollXAfter).toBe(0);
    });
  });
  
  test.describe('Snap Scrolling Tests', () => {
    test('should have snap scrolling enabled', async ({ page, isMobile }) => {
      await page.goto(`${BASE_URL}/test-layout/snap`);
      await page.waitForLoadState('networkidle');
      
      // Check snap container
      const snapContainer = await page.locator('.snap-container-wrapper');
      await expect(snapContainer).toBeVisible();
      
      const snapType = await snapContainer.evaluate(el => {
        return window.getComputedStyle(el).scrollSnapType;
      });
      
      // Just verify y-axis snapping is enabled
      // Note: Some browsers don't report the full value consistently
      expect(snapType).toMatch(/y/);
    });
    
    test('should snap to sections when scrolling', async ({ page, browserName, isMobile }) => {
      await page.goto(`${BASE_URL}/test-layout/snap`);
      await page.waitForLoadState('networkidle');
      
      if (isMobile) {
        // Skip snap precision test on mobile - proximity snap doesn't guarantee exact positions
        // Just verify snap scrolling is configured
        const hasSnapSections = await page.evaluate(() => {
          const sections = document.querySelectorAll('.snap-section');
          return sections.length > 0;
        });
        expect(hasSnapSections).toBe(true);
      } else {
        // Desktop should snap precisely with mandatory
        const viewportHeight = await page.evaluate(() => window.innerHeight);
        
        // Scroll down by 1.5x viewport height within the snap container
        await page.evaluate((height) => {
          const container = document.querySelector('.snap-container-wrapper');
          if (container) {
            container.scrollTo(0, height * 1.5);
          }
        }, viewportHeight);
        
        // Wait for scroll to settle
        await page.waitForTimeout(500);
        
        // Check that we've snapped to exactly 1 viewport height (section 2)
        const scrollY = await page.evaluate(() => {
          const container = document.querySelector('.snap-container-wrapper');
          return container ? container.scrollTop : 0;
        });
        const difference = Math.abs(scrollY - viewportHeight);
        
        // Desktop with mandatory should snap precisely
        expect(difference).toBeLessThan(5);
      }
    });
    
    test('should have correct snap properties on sections', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/snap`);
      
      const section = await page.locator('.snap-section').first();
      
      const snapAlign = await section.evaluate(el => {
        return window.getComputedStyle(el).scrollSnapAlign;
      });
      
      const snapStop = await section.evaluate(el => {
        return window.getComputedStyle(el).scrollSnapStop;
      });
      
      expect(snapAlign).toBe('start');
      expect(snapStop).toBe('always');
    });
  });
  
  test.describe('Stress Tests', () => {
    test('should handle long unbreakable text without horizontal scroll', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/stress`);
      await page.waitForLoadState('networkidle');
      
      // Check no horizontal scroll
      const hasHorizontalScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      expect(hasHorizontalScroll).toBe(false);
      
      // Check text overflow handling
      const warningBox = await page.locator('.bg-warning');
      const overflowWrap = await warningBox.evaluate(el => {
        return window.getComputedStyle(el).overflowWrap;
      });
      
      expect(['break-word', 'anywhere']).toContain(overflowWrap);
    });
    
    test('should handle wide tables with container scrolling only', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/stress`);
      
      const table = await page.locator('table');
      const tableContainer = await page.locator('table').locator('..');
      
      const containerOverflow = await tableContainer.evaluate(el => {
        return window.getComputedStyle(el).overflowX;
      });
      
      expect(containerOverflow).toBe('auto');
      
      // Page should still not have horizontal scroll
      const hasPageScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      expect(hasPageScroll).toBe(false);
    });
    
    test('should handle fixed width elements at mobile viewport', async ({ page }) => {
      await page.setViewportSize({ width: 375, height: 667 });
      await page.goto(`${BASE_URL}/test-layout/stress`);
      
      // Check that fixed width elements exist
      const fixedElements = await page.locator('[style*="width: 1200px"]');
      await expect(fixedElements).toHaveCount(1);
      
      // But no horizontal scroll
      const hasHorizontalScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      expect(hasHorizontalScroll).toBe(false);
    });
  });
  
  test.describe('Dynamic Content Tests', () => {
    test('should maintain layout constraints during LiveView updates', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/dynamic`);
      await page.waitForLoadState('networkidle');
      
      // Wait for LiveView to connect
      await page.waitForTimeout(2000);
      
      // Click add item button
      await page.click('button:has-text("Add Item")');
      await page.waitForTimeout(500);
      
      // Check no horizontal scroll after update
      const hasHorizontalScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      expect(hasHorizontalScroll).toBe(false);
    });
    
    test('should contain wide dynamic content without horizontal scroll', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/dynamic`);
      await page.waitForLoadState('networkidle');
      await page.waitForTimeout(2000);
      
      // Toggle wide content
      await page.click('button:has-text("Toggle Wide Content")');
      await page.waitForTimeout(500);
      
      // Check wide content exists
      const wideContent = await page.locator('[style*="width: 2500px"]');
      await expect(wideContent).toBeVisible();
      
      // But no horizontal scroll
      const hasHorizontalScroll = await page.evaluate(() => {
        return document.documentElement.scrollWidth > document.documentElement.clientWidth;
      });
      expect(hasHorizontalScroll).toBe(false);
    });
  });
  
  test.describe('Touch Device Tests', () => {
    test('should have touch scroll prevention script', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/basic`);
      
      const hasTouchPrevention = await page.evaluate(() => {
        const scripts = Array.from(document.scripts).map(s => s.textContent);
        return scripts.some(s => s.includes('touchstart') && s.includes('touchmove'));
      });
      
      expect(hasTouchPrevention).toBe(true);
    });
    
    test('should have overscroll-behavior-x set to none', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/basic`);
      
      const bodyOverscroll = await page.evaluate(() => {
        return window.getComputedStyle(document.body).overscrollBehaviorX;
      });
      
      const htmlOverscroll = await page.evaluate(() => {
        return window.getComputedStyle(document.documentElement).overscrollBehaviorX;
      });
      
      expect(bodyOverscroll).toBe('none');
      expect(htmlOverscroll).toBe('none');
    });
  });
  
  test.describe('Background Color Tests', () => {
    test('should have consistent background color on html and body', async ({ page }) => {
      await page.goto(`${BASE_URL}/test-layout/basic`);
      
      const htmlBg = await page.evaluate(() => {
        return window.getComputedStyle(document.documentElement).backgroundColor;
      });
      
      const bodyBg = await page.evaluate(() => {
        return window.getComputedStyle(document.body).backgroundColor;
      });
      
      // Both should have the CSS variable color
      expect(htmlBg).not.toBe('rgba(0, 0, 0, 0)'); // Not transparent
      expect(bodyBg).toBe(htmlBg); // Same color
    });
  });
});