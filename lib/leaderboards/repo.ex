defmodule Leaderboards.Repo do
  use Ecto.Repo,
    otp_app: :leaderboards,
    adapter: Ecto.Adapters.Postgres

  def reload(%module{id: id}) do
    get(module, id)
  end
end
