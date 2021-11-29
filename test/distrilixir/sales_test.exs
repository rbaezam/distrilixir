defmodule Distrilixir.SalesTest do
  use Distrilixir.DataCase

  alias Distrilixir.Sales

  describe "quote_requests" do
    alias Distrilixir.Sales.QuoteRequest

    import Distrilixir.SalesFixtures

    @invalid_attrs %{notes: nil}

    test "list_quote_requests/0 returns all quote_requests" do
      quote_request = quote_request_fixture()
      assert Sales.list_quote_requests() == [quote_request]
    end

    test "get_quote_request!/1 returns the quote_request with given id" do
      quote_request = quote_request_fixture()
      assert Sales.get_quote_request!(quote_request.id) == quote_request
    end

    test "create_quote_request/1 with valid data creates a quote_request" do
      valid_attrs = %{notes: "some notes"}

      assert {:ok, %QuoteRequest{} = quote_request} = Sales.create_quote_request(valid_attrs)
      assert quote_request.notes == "some notes"
    end

    test "create_quote_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_quote_request(@invalid_attrs)
    end

    test "update_quote_request/2 with valid data updates the quote_request" do
      quote_request = quote_request_fixture()
      update_attrs = %{notes: "some updated notes"}

      assert {:ok, %QuoteRequest{} = quote_request} = Sales.update_quote_request(quote_request, update_attrs)
      assert quote_request.notes == "some updated notes"
    end

    test "update_quote_request/2 with invalid data returns error changeset" do
      quote_request = quote_request_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_quote_request(quote_request, @invalid_attrs)
      assert quote_request == Sales.get_quote_request!(quote_request.id)
    end

    test "delete_quote_request/1 deletes the quote_request" do
      quote_request = quote_request_fixture()
      assert {:ok, %QuoteRequest{}} = Sales.delete_quote_request(quote_request)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_quote_request!(quote_request.id) end
    end

    test "change_quote_request/1 returns a quote_request changeset" do
      quote_request = quote_request_fixture()
      assert %Ecto.Changeset{} = Sales.change_quote_request(quote_request)
    end
  end
end
