defmodule DistrilixirWeb.Admin.CityController do
  use DistrilixirWeb, :controller

  alias Distrilixir.Locations
  alias Distrilixir.Locations.City

  def index(conn, _params) do
    cities = Locations.list_cities()
    render(conn, "index.html", cities: cities)
  end

  def new(conn, _params) do
    changeset = Locations.change_city(%City{})
    states = Locations.get_all_states()
    render(conn, "new.html", changeset: changeset, states: states)
  end

  def create(conn, %{"city" => city_params}) do
    case Locations.create_city(city_params) do
      {:ok, city} ->
        conn
        |> put_flash(:info, "City created successfully.")
        |> redirect(to: Routes.city_path(conn, :show, city))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Locations.get_city!(id)
    render(conn, "show.html", city: city)
  end

  def edit(conn, %{"id" => id}) do
    city = Locations.get_city!(id)
    changeset = Locations.change_city(city)
    states = Locations.get_all_states()
    render(conn, "edit.html", city: city, changeset: changeset, states: states)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Locations.get_city!(id)

    case Locations.update_city(city, city_params) do
      {:ok, city} ->
        conn
        |> put_flash(:info, "City updated successfully.")
        |> redirect(to: Routes.city_path(conn, :show, city))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", city: city, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Locations.get_city!(id)
    {:ok, _city} = Locations.delete_city(city)

    conn
    |> put_flash(:info, "City deleted successfully.")
    |> redirect(to: Routes.city_path(conn, :index))
  end
end
