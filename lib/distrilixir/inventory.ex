defmodule Distrilixir.Inventory do
  @moduledoc """
  The context for Inventory related models
  """

  import Ecto.Query, warn: false
  alias Distrilixir.Repo

  alias Distrilixir.Inventory.Category

  @doc """
  Returns the list of categories

  ## Examples
      iex> list_all_categories()
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
  Returns and `%Ecto.Changeset{}` for trcking category changes.

  ## Examples

    iex> change_category(category)
    %Ecto.Changeset{data: %Category{}}
  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

end
