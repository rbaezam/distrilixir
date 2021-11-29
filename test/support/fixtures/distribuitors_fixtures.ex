defmodule Distrilixir.DistributorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Distrilixir.Distributors` context.
  """

  @doc """
  Generate a distributor.
  """
  def distributor_fixture(attrs \\ %{}) do
    {:ok, distributor} =
      attrs
      |> Enum.into(%{
        active: true,
        email: "some email",
        name: "some name",
        opening_date: ~N[2021-11-27 23:55:00],
        phone_number: "some phone_number"
      })
      |> Distrilixir.Distributors.create_distributor()

    distributor
  end
end
