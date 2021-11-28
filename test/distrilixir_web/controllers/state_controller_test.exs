defmodule DistrilixirWeb.StateControllerTest do
  use DistrilixirWeb.ConnCase

  import Distrilixir.LocationsFixtures

  @create_attrs %{image_url: "some image_url", name: "some name"}
  @update_attrs %{image_url: "some updated image_url", name: "some updated name"}
  @invalid_attrs %{image_url: nil, name: nil}

  describe "index" do
    test "lists all states", %{conn: conn} do
      conn = get(conn, Routes.state_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing States"
    end
  end

  describe "new state" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.state_path(conn, :new))
      assert html_response(conn, 200) =~ "New State"
    end
  end

  describe "create state" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.state_path(conn, :create), state: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.state_path(conn, :show, id)

      conn = get(conn, Routes.state_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show State"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.state_path(conn, :create), state: @invalid_attrs)
      assert html_response(conn, 200) =~ "New State"
    end
  end

  describe "edit state" do
    setup [:create_state]

    test "renders form for editing chosen state", %{conn: conn, state: state} do
      conn = get(conn, Routes.state_path(conn, :edit, state))
      assert html_response(conn, 200) =~ "Edit State"
    end
  end

  describe "update state" do
    setup [:create_state]

    test "redirects when data is valid", %{conn: conn, state: state} do
      conn = put(conn, Routes.state_path(conn, :update, state), state: @update_attrs)
      assert redirected_to(conn) == Routes.state_path(conn, :show, state)

      conn = get(conn, Routes.state_path(conn, :show, state))
      assert html_response(conn, 200) =~ "some updated image_url"
    end

    test "renders errors when data is invalid", %{conn: conn, state: state} do
      conn = put(conn, Routes.state_path(conn, :update, state), state: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit State"
    end
  end

  describe "delete state" do
    setup [:create_state]

    test "deletes chosen state", %{conn: conn, state: state} do
      conn = delete(conn, Routes.state_path(conn, :delete, state))
      assert redirected_to(conn) == Routes.state_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.state_path(conn, :show, state))
      end
    end
  end

  defp create_state(_) do
    state = state_fixture()
    %{state: state}
  end
end
