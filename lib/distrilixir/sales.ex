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

  alias Distrilixir.Sales.QuoteRequest

  @doc """
  Returns the list of quote_requests.

  ## Examples

      iex> list_quote_requests()
      [%QuoteRequest{}, ...]

  """
  def list_quote_requests do
    Repo.all(QuoteRequest)
  end

  @doc """
  Gets a single quote_request.

  Raises `Ecto.NoResultsError` if the Quote request does not exist.

  ## Examples

      iex> get_quote_request!(123)
      %QuoteRequest{}

      iex> get_quote_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quote_request!(id), do: Repo.get!(QuoteRequest, id)

  @doc """
  Creates a quote_request.

  ## Examples

      iex> create_quote_request(%{field: value})
      {:ok, %QuoteRequest{}}

      iex> create_quote_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quote_request(attrs \\ %{}) do
    %QuoteRequest{}
    |> QuoteRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quote_request.

  ## Examples

      iex> update_quote_request(quote_request, %{field: new_value})
      {:ok, %QuoteRequest{}}

      iex> update_quote_request(quote_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quote_request(%QuoteRequest{} = quote_request, attrs) do
    quote_request
    |> QuoteRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a quote_request.

  ## Examples

      iex> delete_quote_request(quote_request)
      {:ok, %QuoteRequest{}}

      iex> delete_quote_request(quote_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quote_request(%QuoteRequest{} = quote_request) do
    Repo.delete(quote_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quote_request changes.

  ## Examples

      iex> change_quote_request(quote_request)
      %Ecto.Changeset{data: %QuoteRequest{}}

  """
  def change_quote_request(%QuoteRequest{} = quote_request, attrs \\ %{}) do
    QuoteRequest.changeset(quote_request, attrs)
  end
end
