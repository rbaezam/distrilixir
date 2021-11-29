defmodule DistrilixirWeb.Admin.QuoteRequestController do
  use DistrilixirWeb, :controller

  alias Distrilixir.Sales
  alias Distrilixir.Sales.QuoteRequest

  def index(conn, _params) do
    quote_requests = Sales.list_quote_requests()
    render(conn, "index.html", quote_requests: quote_requests)
  end

  def new(conn, _params) do
    changeset = Sales.change_quote_request(%QuoteRequest{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quote_request" => quote_request_params}) do
    case Sales.create_quote_request(quote_request_params) do
      {:ok, quote_request} ->
        conn
        |> put_flash(:info, "Quote request created successfully.")
        |> redirect(to: Routes.quote_request_path(conn, :show, quote_request))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quote_request = Sales.get_quote_request!(id)
    render(conn, "show.html", quote_request: quote_request)
  end

  def edit(conn, %{"id" => id}) do
    quote_request = Sales.get_quote_request!(id)
    changeset = Sales.change_quote_request(quote_request)
    render(conn, "edit.html", quote_request: quote_request, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quote_request" => quote_request_params}) do
    quote_request = Sales.get_quote_request!(id)

    case Sales.update_quote_request(quote_request, quote_request_params) do
      {:ok, quote_request} ->
        conn
        |> put_flash(:info, "Quote request updated successfully.")
        |> redirect(to: Routes.quote_request_path(conn, :show, quote_request))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", quote_request: quote_request, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quote_request = Sales.get_quote_request!(id)
    {:ok, _quote_request} = Sales.delete_quote_request(quote_request)

    conn
    |> put_flash(:info, "Quote request deleted successfully.")
    |> redirect(to: Routes.quote_request_path(conn, :index))
  end
end
