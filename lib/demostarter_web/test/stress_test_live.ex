defmodule DemostarterWeb.Test.StressTestLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-3xl font-bold mb-8">Stress Test Page - Edge Cases</h1>
      
    <!-- Test 1: Very long unbreakable text -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 1: Long Unbreakable Text</h2>
        <div class="bg-warning text-warning-content p-4 rounded">
          <p>
            ThisIsAVeryLongUnbreakableWordThatWouldNormallyBreakHorizontalLayoutsButShouldBeHandledProperlyByOurCSSRulesAndNotCauseAnyHorizontalScrollingIssues
          </p>
        </div>
      </section>
      
    <!-- Test 2: Wide table -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">
          Test 2: Wide Table (should scroll within container)
        </h2>
        <div class="bg-base-200 p-4 rounded overflow-x-auto">
          <table class="table">
            <thead>
              <tr>
                <th>Column 1</th>
                <th>Column 2</th>
                <th>Column 3</th>
                <th>Column 4</th>
                <th>Column 5</th>
                <th>Column 6</th>
                <th>Column 7</th>
                <th>Column 8</th>
                <th>Column 9</th>
                <th>Column 10</th>
                <th>Very Long Column Header That Takes Up Space</th>
                <th>Another Long Header</th>
                <th>Yet Another Column</th>
                <th>More Columns</th>
                <th>Even More Columns</th>
              </tr>
            </thead>
            <tbody>
              <%= for i <- 1..5 do %>
                <tr>
                  <%= for j <- 1..15 do %>
                    <td>Cell {i}-{j} with content</td>
                  <% end %>
                </tr>
              <% end %>
            </tbody>
          </table>
        </div>
      </section>
      
    <!-- Test 3: Pre-formatted code block -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 3: Wide Code Block</h2>
        <div class="bg-base-300 p-4 rounded">
          <pre><code>def very_long_function_name_that_takes_many_parameters(first_parameter, second_parameter, third_parameter, fourth_parameter, fifth_parameter, sixth_parameter, seventh_parameter, eighth_parameter) do
    # This is a very long line of code that would normally cause horizontal scrolling issues
    result = first_parameter + second_parameter + third_parameter + fourth_parameter + fifth_parameter + sixth_parameter + seventh_parameter + eighth_parameter
    Logger.debug("Processing with parameters: [first_parameter], [second_parameter], [third_parameter], [fourth_parameter], [fifth_parameter], [sixth_parameter]")
    result
    end</code></pre>
        </div>
      </section>
      
    <!-- Test 4: Nested flex containers -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 4: Nested Flex Containers</h2>
        <div class="flex gap-4 bg-base-200 p-4 rounded">
          <div class="flex-1 bg-primary text-primary-content p-4 rounded">
            <div class="flex gap-2">
              <div class="bg-primary-focus p-2 rounded min-w-[150px]">Nested 1</div>
              <div class="bg-primary-focus p-2 rounded min-w-[150px]">Nested 2</div>
              <div class="bg-primary-focus p-2 rounded min-w-[150px]">Nested 3</div>
              <div class="bg-primary-focus p-2 rounded min-w-[150px]">Nested 4</div>
            </div>
          </div>
          <div class="flex-1 bg-secondary text-secondary-content p-4 rounded">
            <div class="flex gap-2">
              <div class="bg-secondary-focus p-2 rounded min-w-[150px]">Nested A</div>
              <div class="bg-secondary-focus p-2 rounded min-w-[150px]">Nested B</div>
              <div class="bg-secondary-focus p-2 rounded min-w-[150px]">Nested C</div>
              <div class="bg-secondary-focus p-2 rounded min-w-[150px]">Nested D</div>
            </div>
          </div>
        </div>
      </section>
      
    <!-- Test 5: Fixed positioning elements -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 5: Fixed Width Elements</h2>
        <div class="bg-info text-info-content p-4 rounded">
          <div style="width: 500px; background-color: rgba(0,0,0,0.2); padding: 1rem; margin-bottom: 0.5rem;">
            500px fixed width div
          </div>
          <div style="width: 800px; background-color: rgba(0,0,0,0.3); padding: 1rem; margin-bottom: 0.5rem;">
            800px fixed width div
          </div>
          <div style="width: 1200px; background-color: rgba(0,0,0,0.4); padding: 1rem;">
            1200px fixed width div
          </div>
        </div>
      </section>
      
    <!-- Test 6: SVG with large viewBox -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 6: Large SVG</h2>
        <div class="bg-base-200 p-4 rounded">
          <svg viewBox="0 0 2000 400" style="background: linear-gradient(to right, purple, orange);">
            <text x="1000" y="200" text-anchor="middle" font-size="48" fill="white">
              This SVG has a 2000px viewBox
            </text>
            <circle cx="200" cy="200" r="50" fill="white" opacity="0.5" />
            <circle cx="1800" cy="200" r="50" fill="white" opacity="0.5" />
          </svg>
        </div>
      </section>
      
    <!-- Test 7: Absolute positioned elements -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 7: Absolute Positioned Elements</h2>
        <div class="relative bg-neutral text-neutral-content p-8 rounded" style="height: 200px;">
          <div class="absolute top-4 left-4 bg-error text-error-content p-2 rounded">
            Top Left
          </div>
          <div class="absolute top-4 right-4 bg-error text-error-content p-2 rounded">
            Top Right
          </div>
          <div class="absolute bottom-4 left-4 bg-error text-error-content p-2 rounded">
            Bottom Left
          </div>
          <div class="absolute bottom-4 right-4 bg-error text-error-content p-2 rounded">
            Bottom Right
          </div>
          <div
            class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-success text-success-content p-4 rounded"
            style="width: 300px;"
          >
            Centered with fixed width
          </div>
        </div>
      </section>
      
    <!-- Test 8: Iframe simulation -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 8: Embedded Content Simulation</h2>
        <div class="bg-base-300 p-4 rounded">
          <div style="width: 100%; height: 400px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 24px; font-weight: bold;">
            Simulated iframe/embed content
          </div>
        </div>
      </section>
    </div>
    """
  end
end
