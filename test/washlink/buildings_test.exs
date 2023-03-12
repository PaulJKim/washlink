defmodule Washlink.BuildingsTest do
  use Washlink.DataCase

  alias Washlink.Buildings

  describe "buildings" do
    alias Washlink.Buildings.Building

    import Washlink.BuildingsFixtures

    @invalid_attrs %{address: nil, type: nil}

    test "list_buildings/0 returns all buildings" do
      building = building_fixture()
      assert Buildings.list_buildings() == [building]
    end

    test "get_building!/1 returns the building with given id" do
      building = building_fixture()
      assert Buildings.get_building!(building.id) == building
    end

    test "create_building/1 with valid data creates a building" do
      valid_attrs = %{address: "some address", type: "some type"}

      assert {:ok, %Building{} = building} = Buildings.create_building(valid_attrs)
      assert building.address == "some address"
      assert building.type == "some type"
    end

    test "create_building/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Buildings.create_building(@invalid_attrs)
    end

    test "update_building/2 with valid data updates the building" do
      building = building_fixture()
      update_attrs = %{address: "some updated address", type: "some updated type"}

      assert {:ok, %Building{} = building} = Buildings.update_building(building, update_attrs)
      assert building.address == "some updated address"
      assert building.type == "some updated type"
    end

    test "update_building/2 with invalid data returns error changeset" do
      building = building_fixture()
      assert {:error, %Ecto.Changeset{}} = Buildings.update_building(building, @invalid_attrs)
      assert building == Buildings.get_building!(building.id)
    end

    test "delete_building/1 deletes the building" do
      building = building_fixture()
      assert {:ok, %Building{}} = Buildings.delete_building(building)
      assert_raise Ecto.NoResultsError, fn -> Buildings.get_building!(building.id) end
    end

    test "change_building/1 returns a building changeset" do
      building = building_fixture()
      assert %Ecto.Changeset{} = Buildings.change_building(building)
    end
  end
end
