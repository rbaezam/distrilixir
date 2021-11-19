defmodule Distrilixir.Inventory.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :description, :string
    field :image_url, :string

    belongs_to :parent_category, Distrilixir.Inventory.Category

    timestamps()
  end

  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :description, :image_url, :parent_category_id])
    |> validate_required([:name])
  end
end
