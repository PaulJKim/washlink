defmodule Washlink.AmenitiesTest do
  use Washlink.DataCase

  alias Washlink.Amenities

  describe "amenities" do
    alias Washlink.Amenities.Amenity

    import Washlink.AmenitiesFixtures

    @invalid_attrs %{type: nil}

    test "list_amenities/0 returns all amenities" do
      amenity = amenity_fixture()
      assert Amenities.list_amenities() == [amenity]
    end

    test "get_amenity!/1 returns the amenity with given id" do
      amenity = amenity_fixture()
      assert Amenities.get_amenity!(amenity.id) == amenity
    end

    test "create_amenity/1 with valid data creates a amenity" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %Amenity{} = amenity} = Amenities.create_amenity(valid_attrs)
      assert amenity.type == "some type"
    end

    test "create_amenity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Amenities.create_amenity(@invalid_attrs)
    end

    test "update_amenity/2 with valid data updates the amenity" do
      amenity = amenity_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %Amenity{} = amenity} = Amenities.update_amenity(amenity, update_attrs)
      assert amenity.type == "some updated type"
    end

    test "update_amenity/2 with invalid data returns error changeset" do
      amenity = amenity_fixture()
      assert {:error, %Ecto.Changeset{}} = Amenities.update_amenity(amenity, @invalid_attrs)
      assert amenity == Amenities.get_amenity!(amenity.id)
    end

    test "delete_amenity/1 deletes the amenity" do
      amenity = amenity_fixture()
      assert {:ok, %Amenity{}} = Amenities.delete_amenity(amenity)
      assert_raise Ecto.NoResultsError, fn -> Amenities.get_amenity!(amenity.id) end
    end

    test "change_amenity/1 returns a amenity changeset" do
      amenity = amenity_fixture()
      assert %Ecto.Changeset{} = Amenities.change_amenity(amenity)
    end
  end
end
