defmodule Distrilixir.Sales.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :name, :string
    field :description, :string

    belongs_to :city, Distrilixir.Locations.City

    timestamps()
  end

  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :description, :city_id])
    |> validate_required([:name, :city_id])
  end
end
