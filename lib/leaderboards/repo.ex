defmodule Leaderboards.Repo do
  use Ecto.Repo,
    otp_app: :leaderboards,
    adapter: Ecto.Adapters.Postgres
end
