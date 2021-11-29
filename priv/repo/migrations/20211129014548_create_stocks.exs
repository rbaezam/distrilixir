defmodule Distrilixir.Repo.Migrations.CreateStocks do
  use Ecto.Migration

  def change do
    create table(:stocks) do
      add :quantity, :integer
      add :warehouse_id, references(:warehouses, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:stocks, [:warehouse_id])
    create index(:stocks, [:product_id])
  end
end
