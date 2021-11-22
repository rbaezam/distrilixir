defmodule Distrilixir.Inventory.Warehouse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouses" do
    field :name, :string
    field :description, :string

    belongs_to :city, Distrilixir.Locations.City

    timestamps()
  end

  def changeset(warehouse, attrs) do
    warehouse
    |> cast(attrs, [:name, :description, :city_id])
    |> validate_required([:name, :city_id])
  end
end
