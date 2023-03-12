defmodule Washlink.BuildingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Washlink.Buildings` context.
  """

  @doc """
  Generate a building.
  """
  def building_fixture(attrs \\ %{}) do
    {:ok, building} =
      attrs
      |> Enum.into(%{
        address: "some address",
        type: "some type"
      })
      |> Washlink.Buildings.create_building()

    building
  end
end
