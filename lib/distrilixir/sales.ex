defmodule Distrilixir.Sales do
  @doc """
  The context for Sales related models
  """

  import Ecto.Query, warn: false
  alias Distrilixir.Repo

  alias Distrilixir.Sales.Store

  @doc """
  Returns the list of stores

  ## Examples

    iex> get_all_stores()
    [%Store{}, ...]
  """
  def get_all_stores do
    Repo.all(Store)
  end

  @doc """
  Returns all stores from the given city

  ## Examples

    iex> get_stores_by_city(city_id)
    [%Store{}, ...]
  """
  def get_stores_by_city(city_id) do
    query = from(s in Store, where: s.city_id == ^city_id)
    Repo.all(query)
  end

  @doc """
  Gets a single store

  Raises `Ecto.NoResultsError` if the Store does not exist.

  ## Examples

    iex> get_store!(123)
    %Store{}

    iex> get_store!(0)
    ** (Ecto.NoResultsError)
  """
  def get_store!(id), do: Repo.get!(Store, id)

  @doc """
  Creates a store

  ## Examples

    iex> create_store(%{name: "Store 1", city_id: 1})
    {:ok, %Store{}}

    iex> create_store(%{name: "Store 2"})
    {:error, %Ecto.Changeset{}}
  """
  def create_store(attrs \\ %{}) do
    %Store{}
    |> Store.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a store

  ## Examples

    iex> update_store(store, %{city_id: valid_city_id})
    {:ok, %Store{}}

    iex> update_store(store, %{city_id: invalid_city_id})
    {:error, %Ecto.Changeset{}}
  """
  def update_store(%Store{} = store, attrs) do
    store
    |> Store.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a store

  ## Examples

    iex> delete_store(valid_store)
    {:ok, %Store{}}

    iex> delete_city(invalid_city)
    {:error, %Changeset{}}
  """
  def delete_store(%Store{} = store) do
    Repo.delete(store)
  end
end
