defmodule Washlink.AmenitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Washlink.Amenities` context.
  """

  @doc """
  Generate a amenity.
  """
  def amenity_fixture(attrs \\ %{}) do
    {:ok, amenity} =
      attrs
      |> Enum.into(%{
        type: "some type"
      })
      |> Washlink.Amenities.create_amenity()

    amenity
  end
end
