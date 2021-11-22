# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Distrilixir.Repo.insert!(%Distrilixir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Distrilixir.Repo
alias Distrilixir.Locations
alias Distrilixir.Locations.City
alias Distrilixir.Locations.State
alias Distrilixir.Inventory
alias Distrilixir.Inventory.Warehouse

Repo.delete_all(State)
{:ok, state_yuc} = Locations.create_state(%{name: "Yucatán"})
{:ok, state_qr} = Locations.create_state(%{name: "Quintana Roo"})

Repo.delete_all(City)
Locations.create_city(%{name: "Mérida", state_id: state_yuc.id})
Locations.create_city(%{name: "Chetumal", state_id: state_qr.id})
