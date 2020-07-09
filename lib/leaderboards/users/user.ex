defmodule Leaderboards.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    field :first_name, :string

    def changeset(user_or_changeset, attrs) do
      user_or_changeset
      |> pow_changeset(attrs)
      |> Ecto.Changeset.cast(attrs, [:first_name])
      |> Ecto.Changeset.validate_required([:first_name])
    end

    timestamps()
  end
end
