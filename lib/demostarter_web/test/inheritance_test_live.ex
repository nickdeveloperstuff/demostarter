defmodule DemostarterWeb.Test.InheritanceTestLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-3xl font-bold mb-8">Layout Inheritance Test</h1>

      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">This page tests automatic layout inheritance</h2>
        <p class="mb-4">
          This is a brand new page that doesn't have any special layout configuration.
          It should automatically inherit all the layout system rules.
        </p>
      </section>
      
    <!-- Wide content that should NOT cause horizontal scroll -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Wide Content Test</h2>
        <div style="width: 3000px; background: linear-gradient(to right, #10b981, #3b82f6); height: 100px; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">
          This 3000px wide div should NOT cause horizontal scroll
        </div>
      </section>
      
    <!-- Long unbreakable text -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Long Text Test</h2>
        <div class="bg-info text-info-content p-4 rounded">
          <p>
            SuperLongUnbreakableTextThatWouldNormallyBreakLayoutsButShouldBeHandledAutomaticallyByOurGlobalCSSRulesWithoutAnySpecialConfigurationNeeded
          </p>
        </div>
      </section>
      
    <!-- Flex layout test -->
      <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Responsive Flex Test</h2>
        <div class="flex gap-4">
          <div class="bg-primary text-primary-content p-6 rounded min-w-[300px]">Item 1</div>
          <div class="bg-secondary text-secondary-content p-6 rounded min-w-[300px]">Item 2</div>
          <div class="bg-accent text-accent-content p-6 rounded min-w-[300px]">Item 3</div>
          <div class="bg-neutral text-neutral-content p-6 rounded min-w-[300px]">Item 4</div>
        </div>
      </section>

      <section>
        <p class="text-sm text-base-content/70">
          If you can read this without any horizontal scrollbar appearing,
          then the layout system is working correctly and has been automatically inherited!
        </p>
      </section>
    </div>
    """
  end
end
