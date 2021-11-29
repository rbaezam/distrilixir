defmodule DistrilixirWeb.DistributorControllerTest do
  use DistrilixirWeb.ConnCase

  import Distrilixir.DistributorsFixtures

  @create_attrs %{active: true, email: "some email", name: "some name", opening_date: ~N[2021-11-27 23:55:00], phone_number: "some phone_number"}
  @update_attrs %{active: false, email: "some updated email", name: "some updated name", opening_date: ~N[2021-11-28 23:55:00], phone_number: "some updated phone_number"}
  @invalid_attrs %{active: nil, email: nil, name: nil, opening_date: nil, phone_number: nil}

  describe "index" do
    test "lists all distributors", %{conn: conn} do
      conn = get(conn, Routes.distributor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Distributors"
    end
  end

  describe "new distributor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.distributor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Distributor"
    end
  end

  describe "create distributor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.distributor_path(conn, :create), distributor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.distributor_path(conn, :show, id)

      conn = get(conn, Routes.distributor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Distributor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.distributor_path(conn, :create), distributor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Distributor"
    end
  end

  describe "edit distributor" do
    setup [:create_distributor]

    test "renders form for editing chosen distributor", %{conn: conn, distributor: distributor} do
      conn = get(conn, Routes.distributor_path(conn, :edit, distributor))
      assert html_response(conn, 200) =~ "Edit Distributor"
    end
  end

  describe "update distributor" do
    setup [:create_distributor]

    test "redirects when data is valid", %{conn: conn, distributor: distributor} do
      conn = put(conn, Routes.distributor_path(conn, :update, distributor), distributor: @update_attrs)
      assert redirected_to(conn) == Routes.distributor_path(conn, :show, distributor)

      conn = get(conn, Routes.distributor_path(conn, :show, distributor))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, distributor: distributor} do
      conn = put(conn, Routes.distributor_path(conn, :update, distributor), distributor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Distributor"
    end
  end

  describe "delete distributor" do
    setup [:create_distributor]

    test "deletes chosen distributor", %{conn: conn, distributor: distributor} do
      conn = delete(conn, Routes.distributor_path(conn, :delete, distributor))
      assert redirected_to(conn) == Routes.distributor_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.distributor_path(conn, :show, distributor))
      end
    end
  end

  defp create_distributor(_) do
    distributor = distributor_fixture()
    %{distributor: distributor}
  end
end
