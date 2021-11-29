defmodule Distrilixir.Distributors.Distributor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "distributors" do
    field :active, :boolean, default: false
    field :email, :string
    field :name, :string
    field :opening_date, :naive_datetime
    field :phone_number, :string
    field :city_id, :id

    timestamps()
  end

  @doc false
  def changeset(distributor, attrs) do
    distributor
    |> cast(attrs, [:name, :email, :phone_number, :active, :opening_date])
    |> validate_required([:name, :email, :phone_number, :active, :opening_date])
  end
end
