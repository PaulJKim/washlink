defmodule Washlink.Amenities.Amenity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "amenities" do
    field :type, :string

    belongs_to :building, Washlink.Buildings.Building

    timestamps()
  end

  @doc false
  def changeset(amenity, attrs) do
    amenity
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
