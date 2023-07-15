defmodule Recompile.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RecompileWeb.Telemetry,
      # Start the Ecto repository
      Recompile.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Recompile.PubSub},
      # Start Finch
      {Finch, name: Recompile.Finch},
      # Start the Endpoint (http/https)
      RecompileWeb.Endpoint
      # Start a worker by calling: Recompile.Worker.start_link(arg)
      # {Recompile.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Recompile.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RecompileWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
