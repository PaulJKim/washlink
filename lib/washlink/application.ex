defmodule Washlink.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Washlink.Repo,
      # Start the Telemetry supervisor
      WashlinkWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Washlink.PubSub},
      # Start the Endpoint (http/https)
      WashlinkWeb.Endpoint
      # Start a worker by calling: Washlink.Worker.start_link(arg)
      # {Washlink.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Washlink.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WashlinkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
