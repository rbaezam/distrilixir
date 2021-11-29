defmodule Distrilixir.SalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Distrilixir.Sales` context.
  """

  @doc """
  Generate a quote_request.
  """
  def quote_request_fixture(attrs \\ %{}) do
    {:ok, quote_request} =
      attrs
      |> Enum.into(%{
        notes: "some notes"
      })
      |> Distrilixir.Sales.create_quote_request()

    quote_request
  end
end
