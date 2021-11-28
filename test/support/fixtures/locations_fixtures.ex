defmodule Distrilixir.LocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Distrilixir.Locations` context.
  """

  @doc """
  Generate a state.
  """
  def state_fixture(attrs \\ %{}) do
    {:ok, state} =
      attrs
      |> Enum.into(%{
        image_url: "some image_url",
        name: "some name"
      })
      |> Distrilixir.Locations.create_state()

    state
  end

  @doc """
  Generate a city.
  """
  def city_fixture(attrs \\ %{}) do
    {:ok, city} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Distrilixir.Locations.create_city()

    city
  end
end
