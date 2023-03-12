defmodule WashlinkWeb.BuildingControllerTest do
  use WashlinkWeb.ConnCase

  import Washlink.BuildingsFixtures

  alias Washlink.Buildings.Building

  @create_attrs %{
    address: "some address",
    type: "some type"
  }
  @update_attrs %{
    address: "some updated address",
    type: "some updated type"
  }
  @invalid_attrs %{address: nil, type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all buildings", %{conn: conn} do
      conn = get(conn, Routes.building_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create building" do
    test "renders building when data is valid", %{conn: conn} do
      conn = post(conn, Routes.building_path(conn, :create), building: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.building_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.building_path(conn, :create), building: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update building" do
    setup [:create_building]

    test "renders building when data is valid", %{conn: conn, building: %Building{id: id} = building} do
      conn = put(conn, Routes.building_path(conn, :update, building), building: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.building_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, building: building} do
      conn = put(conn, Routes.building_path(conn, :update, building), building: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete building" do
    setup [:create_building]

    test "deletes chosen building", %{conn: conn, building: building} do
      conn = delete(conn, Routes.building_path(conn, :delete, building))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.building_path(conn, :show, building))
      end
    end
  end

  defp create_building(_) do
    building = building_fixture()
    %{building: building}
  end
end
