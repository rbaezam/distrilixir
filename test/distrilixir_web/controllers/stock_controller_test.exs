defmodule DistrilixirWeb.StockControllerTest do
  use DistrilixirWeb.ConnCase

  import Distrilixir.InventoryFixtures

  @create_attrs %{quantity: 42}
  @update_attrs %{quantity: 43}
  @invalid_attrs %{quantity: nil}

  describe "index" do
    test "lists all stocks", %{conn: conn} do
      conn = get(conn, Routes.stock_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Stocks"
    end
  end

  describe "new stock" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.stock_path(conn, :new))
      assert html_response(conn, 200) =~ "New Stock"
    end
  end

  describe "create stock" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stock_path(conn, :create), stock: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.stock_path(conn, :show, id)

      conn = get(conn, Routes.stock_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Stock"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stock_path(conn, :create), stock: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Stock"
    end
  end

  describe "edit stock" do
    setup [:create_stock]

    test "renders form for editing chosen stock", %{conn: conn, stock: stock} do
      conn = get(conn, Routes.stock_path(conn, :edit, stock))
      assert html_response(conn, 200) =~ "Edit Stock"
    end
  end

  describe "update stock" do
    setup [:create_stock]

    test "redirects when data is valid", %{conn: conn, stock: stock} do
      conn = put(conn, Routes.stock_path(conn, :update, stock), stock: @update_attrs)
      assert redirected_to(conn) == Routes.stock_path(conn, :show, stock)

      conn = get(conn, Routes.stock_path(conn, :show, stock))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, stock: stock} do
      conn = put(conn, Routes.stock_path(conn, :update, stock), stock: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Stock"
    end
  end

  describe "delete stock" do
    setup [:create_stock]

    test "deletes chosen stock", %{conn: conn, stock: stock} do
      conn = delete(conn, Routes.stock_path(conn, :delete, stock))
      assert redirected_to(conn) == Routes.stock_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.stock_path(conn, :show, stock))
      end
    end
  end

  defp create_stock(_) do
    stock = stock_fixture()
    %{stock: stock}
  end
end
