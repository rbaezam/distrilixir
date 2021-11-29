defmodule Distrilixir.Inventory do
  @moduledoc """
  The context for Inventory related models
  """

  import Ecto.Query, warn: false
  alias Distrilixir.Repo

  alias Distrilixir.Inventory.Category
  alias Distrilixir.Inventory.Product
  alias Distrilixir.Inventory.Warehouse

  @doc """
  Returns the list of categories

  ## Examples
      iex> get_all_categories()
      [%Category{}, ...]
  """
  def get_all_categories do
    Repo.all(Category)
  end

  @doc """
  Gets all the subcategories from the category id.

  ## Examples

    iex> get_categories_by_parent_category_id(valid_id)
    [%Category{}, ...]
  """
  def get_categories_by_parent_category_id(parent_id) do
    query = from(c in Category, where: c.parent_category_id == ^parent_id)
    Repo.all(query)
  end

  @doc """
  Gets a single category

  Raises `Ecto.NoResultsError` if the Category does no exist.

  ## Examples

    iex> get_category!(123)
    %Category{}

    iex> get_category!(456)
    ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category

  ## Examples

    iex> create_category(%{name: name})
    {:ok, %Category{}}

    iex> create_category(%{name: bad_value})
    {:error, %Ecto.Changeset{}}
  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert
  end

  @doc """
  Updates a category.

  ## Examples

    iex> update_category(category, %{description: new_value})
    {:ok, %Category{}}

    iex> update_category(category, %{description: bad_value})
    {:error, %Ecto.Changeset{}}
  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

    iex> delete_category(category)
    {:ok, %Category{}}

    iex> delete_category(category)
    {:error, %Changeset{}}
  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns and `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

    iex> change_category(category)
    %Ecto.Changeset{data: %Category{}}
  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  @doc """
  Returns all products from given category

  ## Examples

    iex> get_products_by_category_id(valid_category_id)
    [%Product{}, ...]
  """
  def get_products_by_category(category_id) do
    query = from(p in Product, where: p.category_id == ^category_id)
    Repo.all(query)
  end

  @doc """
  Gets a single product

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

    iex> get_product!(123)
    %Product{}

    iex> get_product!(999)
    ** (Ecto.NoResultsError)
  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product

  ## Examples

    iex> create_product(%{name: "Product 1", category_id: 1})
    {:ok, %Product{}}

    iex> create_product(%{name: "Bad value"})
    {:error, %Ecto.Changeset{}}
  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product

  ## Examples

    iex> update_product(product, %{description: new_value})
    {:ok, %Product{}}

    iex> update_product(product, %{description: bad_value})
    {:error, %Ecto.Changeset{}}
  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product

  ## Examples

    iex> delete_product(valid_product)
    {:ok, %Product{}}

    iex> delete_product(invalid_product)
    {:error, %Changeset{}}
  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns and `%Ecto.Changeset{}` for tracking product changes

  ## Examples

    iex> change_category(product)
    %Ecto.Changeset(data: %Product{})
  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  @doc """
  Returns the list of warehouses

  ## Examples

    iex> get_all_warehouses()
    [%Warehouse{}, ...]
  """
  def get_all_warehouses do
    Repo.all(Warehouse)
  end

  @doc """
  Gets a single warehouse

  Raises `Ecto.NoResultsError` if the Warehouse does not exist.

  ## Examples

    iex> get_warehouse(123)
    %Warehouse{}

    iex> get_warehouse(0)
    ** (Ecto.NoResultsError)
  """
  def get_warehouse!(id), do: Repo.get!(Warehouse, id)

  @doc """
  Creates a warehouse

  ## Examples

    iex> create_warehouse(%{name: name})
    {:ok, %Warehouse{}}

    iex> create_warehouse(%{name: invalid_name})
    {:error, %Ecto.Changeset{}}
  """
  def create_warehouse(attrs \\ %{}) do
    %Warehouse{}
    |> Warehouse.changeset(attrs)
    |> Repo.insert
  end

  @doc """
  Updates a warehouse

  ## Examples

    iex> update_warehouse(warehouse, %{name: new_value})
    {:ok, %Warehouse{}}

    iex> update_warehouse(warehouse, %{name: bad_value})
    {:error, %Ecto.Changeset{}}
  """
  def update_warehouse(%Warehouse{} = warehouse, attrs) do
    warehouse
    |> Warehouse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a warehouse

  ## Examples

    iex> delete_warehouse(warehouse)
    {:ok, %Warehouse{}}

    iex> delete_warehouse(bad_warehouse)
    {:error, %Changeset{}}
  """
  def delete_warehouse(%Warehouse{} = warehouse) do
    Repo.delete(warehouse)
  end

  alias Distrilixir.Inventory.Stock

  @doc """
  Returns the list of stocks.

  ## Examples

      iex> list_stocks()
      [%Stock{}, ...]

  """
  def list_stocks do
    Repo.all(Stock)
  end

  @doc """
  Gets a single stock.

  Raises `Ecto.NoResultsError` if the Stock does not exist.

  ## Examples

      iex> get_stock!(123)
      %Stock{}

      iex> get_stock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stock!(id), do: Repo.get!(Stock, id)

  @doc """
  Creates a stock.

  ## Examples

      iex> create_stock(%{field: value})
      {:ok, %Stock{}}

      iex> create_stock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stock(attrs \\ %{}) do
    %Stock{}
    |> Stock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stock.

  ## Examples

      iex> update_stock(stock, %{field: new_value})
      {:ok, %Stock{}}

      iex> update_stock(stock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stock(%Stock{} = stock, attrs) do
    stock
    |> Stock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stock.

  ## Examples

      iex> delete_stock(stock)
      {:ok, %Stock{}}

      iex> delete_stock(stock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stock(%Stock{} = stock) do
    Repo.delete(stock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stock changes.

  ## Examples

      iex> change_stock(stock)
      %Ecto.Changeset{data: %Stock{}}

  """
  def change_stock(%Stock{} = stock, attrs \\ %{}) do
    Stock.changeset(stock, attrs)
  end
end
