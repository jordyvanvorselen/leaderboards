defmodule LeaderboardsWeb.PageController do
  use LeaderboardsWeb, :controller
  alias Leaderboards.Users.User, as: User

  def index(conn, _params) do
    render(conn, "index.html", user: Pow.Plug.current_user(conn) |> Leaderboards.Repo.reload())
  end

  def increment(conn, _params) do
    Pow.Plug.current_user(conn)
    |> Leaderboards.Repo.reload()
    |> User.increment_score()

    render(conn, "index.html", user: Pow.Plug.current_user(conn) |> Leaderboards.Repo.reload())
  end
end
