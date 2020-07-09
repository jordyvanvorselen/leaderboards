defmodule LeaderboardsWeb.PageController do
  use LeaderboardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
