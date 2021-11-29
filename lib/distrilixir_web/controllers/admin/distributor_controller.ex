defmodule DistrilixirWeb.Admin.DistributorController do
  use DistrilixirWeb, :controller

  alias Distrilixir.Distributors
  alias Distrilixir.Distributors.Distributor

  def index(conn, _params) do
    distributors = Distributors.list_distributors()
    render(conn, "index.html", distributors: distributors)
  end

  def new(conn, _params) do
    changeset = Distributors.change_distributor(%Distributor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"distributor" => distributor_params}) do
    case Distributors.create_distributor(distributor_params) do
      {:ok, distributor} ->
        conn
        |> put_flash(:info, "Distributor created successfully.")
        |> redirect(to: Routes.distributor_path(conn, :show, distributor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    distributor = Distributors.get_distributor!(id)
    render(conn, "show.html", distributor: distributor)
  end

  def edit(conn, %{"id" => id}) do
    distributor = Distributors.get_distributor!(id)
    changeset = Distributors.change_distributor(distributor)
    render(conn, "edit.html", distributor: distributor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "distributor" => distributor_params}) do
    distributor = Distributors.get_distributor!(id)

    case Distributors.update_distributor(distributor, distributor_params) do
      {:ok, distributor} ->
        conn
        |> put_flash(:info, "Distributor updated successfully.")
        |> redirect(to: Routes.distributor_path(conn, :show, distributor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", distributor: distributor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    distributor = Distributors.get_distributor!(id)
    {:ok, _distributor} = Distributors.delete_distributor(distributor)

    conn
    |> put_flash(:info, "Distributor deleted successfully.")
    |> redirect(to: Routes.distributor_path(conn, :index))
  end
end
