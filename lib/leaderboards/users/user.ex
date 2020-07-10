defmodule Leaderboards.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    pow_user_fields()

    field :first_name, :string
    field :score, :integer, default: 0
    field :avatar, Leaderboards.Avatar.Type

    timestamps()

    def changeset(user_or_changeset, attrs) do
      user_or_changeset
      |> pow_changeset(attrs)
      |> Ecto.Changeset.cast(attrs, [:first_name, :score])
      |> cast_attachments(attrs, [:avatar])
      |> Ecto.Changeset.validate_required([:first_name, :avatar])
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
