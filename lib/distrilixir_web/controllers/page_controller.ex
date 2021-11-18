defmodule DistrilixirWeb.PageController do
  use DistrilixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
