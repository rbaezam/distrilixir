defmodule Distrilixir.Repo do
  use Ecto.Repo,
    otp_app: :distrilixir,
    adapter: Ecto.Adapters.Postgres
end
