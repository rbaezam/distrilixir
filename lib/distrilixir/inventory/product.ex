defmodule Distrilixir.Inventory.Product do
	use Ecto.Schema
	import Ecto.Changeset

	schema "products" do
		field :name, :string
		field :description, :string
		field :image_url, :string

		belongs_to :category, Distrilixir.Inventory.Category

		timestamps()
	end

	def changeset(product, attrs) do
		product
		|> cast(attrs, [:name, :description, :image_url, :category_id])
		|> validate_required([:name, :category_id])
	end
end
