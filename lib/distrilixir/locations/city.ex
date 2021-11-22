defmodule Distrilixir.Locations.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :name, :string

    belongs_to :state, Distrilixir.Locations.State

    timestamps()
  end

  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :state_id])
    |> validate_required([:name, :state_id])
  end

end
