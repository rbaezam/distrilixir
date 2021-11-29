defmodule Distrilixir.Repo.Migrations.CreateQuoteRequests do
  use Ecto.Migration

  def change do
    create table(:quote_requests) do
      add :notes, :text
      add :distributor_id, references(:distributors, on_delete: :nothing)
      add :captured_by, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:quote_requests, [:distributor_id])
    create index(:quote_requests, [:captured_by])
  end
end
