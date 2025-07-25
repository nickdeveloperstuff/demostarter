defmodule DemostarterWeb.UiComponentsLive do
  use DemostarterWeb, :live_view
  
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
  
  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1>UI Components Page</h1>
      <p>Replace this with actual content later.</p>
    </div>
    """
  end
end