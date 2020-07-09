defmodule Leaderboards.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    pow_user_fields()

    field :first_name, :string
    field :score, :integer, default: 0

    timestamps()

    def changeset(user_or_changeset, attrs) do
      user_or_changeset
      |> pow_changeset(attrs)
      |> IO.inspect()
      |> Ecto.Changeset.cast(attrs, [:first_name, :score])
      |> Ecto.Changeset.validate_required([:first_name])
    end

    def increment_score(user) do
      user
      |> change_score(if(user.score, do: user.score + 1, else: 1))
    end

    def decrement_score(user) do
      user
      |> change_score(if(user.score, do: user.score - 1, else: 1))
    end

    def change_score(user, score) do
      user
      |> change(%{score: score})
      |> Leaderboards.Repo.update()
    end
  end
end
