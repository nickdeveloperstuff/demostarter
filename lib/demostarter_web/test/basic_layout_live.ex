defmodule DemostarterWeb.Test.BasicLayoutLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-3xl font-bold mb-8">Basic Layout Test Page</h1>
      
    <!-- Test 1: Wide content that should NOT cause horizontal scroll -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 1: Wide Content Prevention</h2>
        <div style="width: 2000px; background: linear-gradient(to right, #ff0000, #0000ff); height: 100px; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">
          This 2000px wide div should NOT cause horizontal scroll
        </div>
      </section>
      
    <!-- Test 2: Responsive Grid -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 2: Responsive Grid Stacking</h2>
        <div class="grid gap-4">
          <div class="bg-primary text-primary-content p-6 rounded">Grid Item 1</div>
          <div class="bg-secondary text-secondary-content p-6 rounded">Grid Item 2</div>
          <div class="bg-accent text-accent-content p-6 rounded">Grid Item 3</div>
          <div class="bg-neutral text-neutral-content p-6 rounded">Grid Item 4</div>
        </div>
      </section>
      
    <!-- Test 3: Flex Layout -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 3: Flex Layout Wrapping</h2>
        <div class="flex gap-4">
          <div class="bg-info text-info-content p-6 rounded min-w-[200px]">Flex Item 1</div>
          <div class="bg-success text-success-content p-6 rounded min-w-[200px]">Flex Item 2</div>
          <div class="bg-warning text-warning-content p-6 rounded min-w-[200px]">Flex Item 3</div>
          <div class="bg-error text-error-content p-6 rounded min-w-[200px]">Flex Item 4</div>
        </div>
      </section>
      
    <!-- Test 4: Long content for vertical scroll -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 4: Vertical Scrolling</h2>
        <div class="bg-base-200 p-6 rounded">
          <p class="mb-4">This section contains enough content to test vertical scrolling.</p>
          <%= for i <- 1..20 do %>
            <p class="mb-2">Line {i}: Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          <% end %>
        </div>
      </section>
      
    <!-- Test 5: Images -->
      <section class="mb-12">
        <h2 class="text-xl font-semibold mb-4">Test 5: Large Image Handling</h2>
        <div class="bg-base-300 p-4 rounded">
          <div style="width: 1500px; height: 200px; background: linear-gradient(45deg, #ff00ff, #00ffff); display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">
            Simulated 1500px wide image
          </div>
        </div>
      </section>
    </div>
    """
  end
end
