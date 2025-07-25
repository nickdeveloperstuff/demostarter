defmodule DemostarterWeb.Test.SnapScrollingLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="snap-container-wrapper">
      <!-- Section 1 -->
      <div class="snap-section bg-primary text-primary-content flex items-center justify-center">
        <div class="text-center p-8">
          <h1 class="text-5xl font-bold mb-4">Section 1</h1>
          <p class="text-xl">This is the first snap section</p>
          <p class="mt-4">Scroll down to snap to the next section</p>
          <div class="mt-8">
            <svg
              class="w-8 h-8 mx-auto animate-bounce"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M19 14l-7 7m0 0l-7-7m7 7V3"
              >
              </path>
            </svg>
          </div>
        </div>
      </div>
      
    <!-- Section 2 -->
      <div class="snap-section bg-secondary text-secondary-content flex items-center justify-center">
        <div class="text-center p-8">
          <h1 class="text-5xl font-bold mb-4">Section 2</h1>
          <p class="text-xl">This is the second snap section</p>
          <div class="mt-8 max-w-2xl mx-auto">
            <p>Notice how the page "snaps" into place when you scroll.</p>
            <p class="mt-2">This creates a page-by-page scrolling experience.</p>
          </div>
        </div>
      </div>
      
    <!-- Section 3 -->
      <div class="snap-section bg-accent text-accent-content flex items-center justify-center">
        <div class="text-center p-8">
          <h1 class="text-5xl font-bold mb-4">Section 3</h1>
          <p class="text-xl">This is the third snap section</p>
          <div class="mt-8">
            <p>Each section takes up the full viewport height.</p>
            <p class="mt-2">The scroll-snap-type is set to "proximity" for a smoother experience.</p>
          </div>
        </div>
      </div>
      
    <!-- Section 4 -->
      <div class="snap-section bg-neutral text-neutral-content flex items-center justify-center">
        <div class="text-center p-8">
          <h1 class="text-5xl font-bold mb-4">Section 4</h1>
          <p class="text-xl">This is the fourth snap section</p>
          <div class="mt-8">
            <p>You can scroll up to go back to previous sections.</p>
            <p class="mt-2">The snapping works in both directions.</p>
          </div>
        </div>
      </div>
      
    <!-- Section 5 -->
      <div class="snap-section bg-base-300 text-base-content flex items-center justify-center">
        <div class="text-center p-8">
          <h1 class="text-5xl font-bold mb-4">Section 5</h1>
          <p class="text-xl">This is the final snap section</p>
          <div class="mt-8">
            <p>You've reached the end of the snap scrolling demo!</p>
            <div class="mt-4">
              <svg class="w-8 h-8 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M5 11l7-7 7 7M5 19l7-7 7 7"
                >
                </path>
              </svg>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
