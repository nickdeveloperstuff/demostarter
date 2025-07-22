defmodule Demostarter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DemostarterWeb.Telemetry,
      Demostarter.Repo,
      {DNSCluster, query: Application.get_env(:demostarter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Demostarter.PubSub},
      # Start a worker by calling: Demostarter.Worker.start_link(arg)
      # {Demostarter.Worker, arg},
      # Start to serve requests, typically the last entry
      DemostarterWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :demostarter]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Demostarter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DemostarterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
