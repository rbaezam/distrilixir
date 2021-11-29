defmodule Distrilixir.Repo.Migrations.CreateDistributors do
  use Ecto.Migration

  def change do
    create table(:distributors) do
      add :name, :string
      add :email, :string
      add :phone_number, :string
      add :active, :boolean, default: false, null: false
      add :opening_date, :naive_datetime
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps()
    end

    create index(:distributors, [:city_id])
  end
end
