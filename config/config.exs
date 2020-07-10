# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :leaderboards,
  ecto_repos: [Leaderboards.Repo]

# Configures the endpoint
config :leaderboards, LeaderboardsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YFQxu7KGKOlPgxBc5yexezE9ixHrF/VCS+KFUjbhUulvmqhU5l3/auATv5tGPZWZ",
  render_errors: [view: LeaderboardsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Leaderboards.PubSub,
  live_view: [signing_salt: "76Fls/pR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :leaderboards, :pow,
  user: Leaderboards.Users.User,
  repo: Leaderboards.Repo,
  web_module: LeaderboardsWeb

config :arc,
  storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
