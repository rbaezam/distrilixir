defmodule Distrilixir.Locations.State do
  use Ecto.Schema
  import Ecto.Changeset

  schema "states" do
    field :name, :string

    timestamps()
  end

  def changeset(state, attrs) do
    state
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
