defmodule Distrilixir.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Distrilixir.Inventory` context.
  """

  @doc """
  Generate a stock.
  """
  def stock_fixture(attrs \\ %{}) do
    {:ok, stock} =
      attrs
      |> Enum.into(%{
        quantity: 42
      })
      |> Distrilixir.Inventory.create_stock()

    stock
  end
end
