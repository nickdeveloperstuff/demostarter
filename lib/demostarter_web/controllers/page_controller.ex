defmodule DemostarterWeb.PageController do
  use DemostarterWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
