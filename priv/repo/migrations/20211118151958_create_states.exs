defmodule Distrilixir.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string
      add :image_url, :string

      timestamps()
    end
  end
end
