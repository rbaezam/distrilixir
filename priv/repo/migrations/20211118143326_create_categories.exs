defmodule Distrilixir.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :description, :text
      add :image_url, :string
      add :parent_category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:categories, [:parent_category_id])
  end
end
