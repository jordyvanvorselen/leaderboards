defmodule Leaderboards.Repo.Migrations.UsersAddScoreColumn do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :score, :integer
    end
  end
end
