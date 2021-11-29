defmodule DistrilixirWeb.QuoteRequestControllerTest do
  use DistrilixirWeb.ConnCase

  import Distrilixir.SalesFixtures

  @create_attrs %{notes: "some notes"}
  @update_attrs %{notes: "some updated notes"}
  @invalid_attrs %{notes: nil}

  describe "index" do
    test "lists all quote_requests", %{conn: conn} do
      conn = get(conn, Routes.quote_request_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Quote requests"
    end
  end

  describe "new quote_request" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.quote_request_path(conn, :new))
      assert html_response(conn, 200) =~ "New Quote request"
    end
  end

  describe "create quote_request" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.quote_request_path(conn, :create), quote_request: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.quote_request_path(conn, :show, id)

      conn = get(conn, Routes.quote_request_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Quote request"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.quote_request_path(conn, :create), quote_request: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Quote request"
    end
  end

  describe "edit quote_request" do
    setup [:create_quote_request]

    test "renders form for editing chosen quote_request", %{conn: conn, quote_request: quote_request} do
      conn = get(conn, Routes.quote_request_path(conn, :edit, quote_request))
      assert html_response(conn, 200) =~ "Edit Quote request"
    end
  end

  describe "update quote_request" do
    setup [:create_quote_request]

    test "redirects when data is valid", %{conn: conn, quote_request: quote_request} do
      conn = put(conn, Routes.quote_request_path(conn, :update, quote_request), quote_request: @update_attrs)
      assert redirected_to(conn) == Routes.quote_request_path(conn, :show, quote_request)

      conn = get(conn, Routes.quote_request_path(conn, :show, quote_request))
      assert html_response(conn, 200) =~ "some updated notes"
    end

    test "renders errors when data is invalid", %{conn: conn, quote_request: quote_request} do
      conn = put(conn, Routes.quote_request_path(conn, :update, quote_request), quote_request: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Quote request"
    end
  end

  describe "delete quote_request" do
    setup [:create_quote_request]

    test "deletes chosen quote_request", %{conn: conn, quote_request: quote_request} do
      conn = delete(conn, Routes.quote_request_path(conn, :delete, quote_request))
      assert redirected_to(conn) == Routes.quote_request_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.quote_request_path(conn, :show, quote_request))
      end
    end
  end

  defp create_quote_request(_) do
    quote_request = quote_request_fixture()
    %{quote_request: quote_request}
  end
end
