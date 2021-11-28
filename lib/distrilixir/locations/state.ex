defmodule Distrilixir.Locations.State do
  use Ecto.Schema
  import Ecto.Changeset

  schema "states" do
    field :image_url, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(state, attrs) do
    state
    |> cast(attrs, [:name, :image_url])
    |> validate_required([:name])
  end
end
