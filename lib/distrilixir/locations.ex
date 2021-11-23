defmodule Distrilixir.Locations do
  @moduledoc """
  The context for Locations related models
  """

  import Ecto.Query, warn: false
  alias Distrilixir.Repo

  alias Distrilixir.Locations.State
  alias Distrilixir.Locations.City

  @doc """
  Returns the list of states

  ## Examples

    iex> get_all_states()
    [%State{}, ...]
  """
  def get_all_states do
    Repo.all(State)
  end

  @doc """
  Gets a single state

  Raises `Ecto.NoResultsError` if the State does not exist.

  ## Examples

    iex> get_state!(123)
    %State{}

    iex> get_state!(999)
    ** (Ecto.NoResultsError)
  """
  def get_state!(id), do: Repo.get!(State, id)

  @doc """
  Creates a state

  ## Examples

    iex> create_state(%{name: name})
    {:ok, %State{}}

    iex> create_state(%{name: bad_value})
    {:error, %Ecto.Changeset{}}
  """
  def create_state(attrs \\ %{}) do
    %State{}
    |> State.changeset(attrs)
    |> Repo.insert
  end

  @doc """
  Updates a state

  ## Examples

    iex> update_state(state, %{name: new_value})
    {:ok, %State{}}

    iex> update_state(state, %{name: bad_value})
    {:error, %Ecto.Changeset{}}
  """
  def update_state(%State{} = state, attrs) do
    state
    |> State.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a state

  ## Examples

    iex> delete_state(state)
    {:ok, %State{}}

    iex> delete_state(bad_state)
    {:error, %Changeset{}}
  """
  def delete_state(%State{} = state) do
    Repo.delete(state)
  end

  @doc """
  Returns all cities from the given state

  ## Examples

    iex> get_cities_by_state(state_id)
    [%City{}, ...]
  """
  def get_cities_by_state(state_id) do
    query = from(c in City, where: c.state_id == ^state_id)
    Repo.all(query)
  end

  @doc """
  Gets a single city

  Raises `Ecto.NoResultsError` if the city does not exist.

  ## Examples

    iex> get_city!(123)
    %City{}

    iex> get_city(0)
    ** (Ecto.NoResultsError)
  """
  def get_city!(id), do: Repo.get!(City, id)

  @doc """
  Creates a city

  ## Examples

    iex> create_city(%{name: "City 1", state_id: 1})
    {:ok, %City{}}

    iex> create_city(%{name: "City 1"})
    {:error, %Ecto.Changeset{}}
  """
  def create_city(attrs \\ %{}) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city

  ## Examples

    iex> update_city(city, %{state_id: valid_state_id})
    {:ok, %City{}}

    iex> update_city(city, %{state_id: invalid_state_id})
    {:error, %Ecto.Changeset{}}
  """
  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a city

  ## Examples

    iex> delete_city(valid_city)
    {:ok, %City{}}

    iex> delete_city(invalid_city)
    {:error, %Changeset{}}
  """
  def delete_city(%City{} = city) do
    Repo.delete(city)
  end
end
