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
  Gets a single category

  Raises `Ecto.NoResultsError` if the Category does no exist.

  ## Examples

    iex> get_category!(123)
    %Category{}

    iex> get_category!(456)
    ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)
end
