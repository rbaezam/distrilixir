defmodule Distrilixir.Inventory.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    field :quantity, :integer
    belongs_to :warehouse, Distrilixir.Inventory.Warehouse
    belongs_to :product, Distrilixir.Inventory.Product

    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:quantity, :warehouse_id, :product_id])
    |> validate_required([:quantity, :warehouse_id, :product_id])
  end
end
