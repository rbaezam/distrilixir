defmodule Distrilixir.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string
      add :description, :text
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps()
    end

    create index(:stores, [:city_id])
  end
end
