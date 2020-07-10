defmodule LeaderboardsWeb.PageController do
  use LeaderboardsWeb, :controller
  alias Leaderboards.Users.User, as: User
  alias Leaderboards.Repo, as: Repo

  def index(conn, _params) do
    [winner | losers] = sorted_users

    render(conn, "index.html", winner: winner, losers: losers)
  end

  def increment(conn, params) do
    Repo.get(User, params["id"])
    |> User.increment_score()

    [winner | losers] = sorted_users

    render(conn, "index.html", winner: winner, losers: losers)
  end

  defp sorted_users do
    Repo.all(User) |> Enum.sort_by(& &1.score, :desc)
  end
end
