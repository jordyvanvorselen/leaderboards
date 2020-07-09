defmodule Leaderboards.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Leaderboards.Repo,
      # Start the Telemetry supervisor
      LeaderboardsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Leaderboards.PubSub},
      # Start the Endpoint (http/https)
      LeaderboardsWeb.Endpoint
      # Start a worker by calling: Leaderboards.Worker.start_link(arg)
      # {Leaderboards.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Leaderboards.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LeaderboardsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
