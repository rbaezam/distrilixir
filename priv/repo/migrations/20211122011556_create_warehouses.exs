defmodule Distrilixir.Repo.Migrations.CreateWarehouses do
  use Ecto.Migration

  def change do
    create table(:warehouses) do
      add :name, :string
      add :description, :text
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps()
    end

    create index(:warehouses, [:city_id])
  end
end
