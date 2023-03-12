defmodule Washlink.Buildings.Building do
  use Ecto.Schema
  import Ecto.Changeset

  schema "buildings" do
    field :address, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(building, attrs) do
    building
    |> cast(attrs, [:address, :type])
    |> validate_required([:address, :type])
  end
end
