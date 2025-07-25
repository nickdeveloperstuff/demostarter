defmodule DemostarterWeb.Router do
  use DemostarterWeb, :router

  use AshAuthentication.Phoenix.Router

  import AshAuthentication.Plug.Helpers

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {DemostarterWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :load_from_session
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :load_from_bearer
    plug :set_actor, :user
  end

  scope "/", DemostarterWeb do
    pipe_through :browser

    ash_authentication_live_session :authenticated_routes do
      # in each liveview, add one of the following at the top of the module:
      #
      # If an authenticated user must be present:
      # on_mount {DemostarterWeb.LiveUserAuth, :live_user_required}
      #
      # If an authenticated user *may* be present:
      # on_mount {DemostarterWeb.LiveUserAuth, :live_user_optional}
      #
      # If an authenticated user must *not* be present:
      # on_mount {DemostarterWeb.LiveUserAuth, :live_no_user}
    end
  end

  scope "/", DemostarterWeb do
    pipe_through :browser

    get "/", PageController, :home
    live "/ui-components", UiComponentsLive
    live "/demo-ui-dashboard", DemoUiDashboardLive
    live "/new-demo-dashboard", NewDemoDashboardLive
    auth_routes AuthController, Demostarter.Accounts.User, path: "/auth"
    sign_out_route AuthController

    # Remove these if you'd like to use your own authentication views
    sign_in_route register_path: "/register",
                  reset_path: "/reset",
                  auth_routes_prefix: "/auth",
                  on_mount: [{DemostarterWeb.LiveUserAuth, :live_no_user}],
                  overrides: [
                    DemostarterWeb.AuthOverrides,
                    AshAuthentication.Phoenix.Overrides.Default
                  ]

    # Remove this if you do not want to use the reset password feature
    reset_route auth_routes_prefix: "/auth",
                overrides: [
                  DemostarterWeb.AuthOverrides,
                  AshAuthentication.Phoenix.Overrides.Default
                ]

    # Remove this if you do not use the confirmation strategy
    confirm_route Demostarter.Accounts.User, :confirm_new_user,
      auth_routes_prefix: "/auth",
      overrides: [DemostarterWeb.AuthOverrides, AshAuthentication.Phoenix.Overrides.Default]

    # Remove this if you do not use the magic link strategy.
    magic_sign_in_route(Demostarter.Accounts.User, :magic_link,
      auth_routes_prefix: "/auth",
      overrides: [DemostarterWeb.AuthOverrides, AshAuthentication.Phoenix.Overrides.Default]
    )
  end

  # Layout system test routes
  scope "/test-layout", DemostarterWeb.Test do
    pipe_through :browser

    live "/basic", BasicLayoutLive
    live "/snap", SnapScrollingLive
    live "/stress", StressTestLive
    live "/dynamic", DynamicContentLive
    live "/inheritance", InheritanceTestLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", DemostarterWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:demostarter, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: DemostarterWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  if Application.compile_env(:demostarter, :dev_routes) do
    import AshAdmin.Router

    scope "/admin" do
      pipe_through :browser

      ash_admin "/"
    end
  end
end
