defmodule Distrilixir.Sales.QuoteRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quote_requests" do
    field :notes, :string
    field :distributor_id, :id
    field :captured_by, :id

    timestamps()
  end

  @doc false
  def changeset(quote_request, attrs) do
    quote_request
    |> cast(attrs, [:notes])
    |> validate_required([:notes])
  end
end
