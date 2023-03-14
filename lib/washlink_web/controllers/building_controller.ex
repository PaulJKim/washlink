defmodule WashlinkWeb.BuildingController do
  use WashlinkWeb, :controller

  alias Washlink.Buildings
  alias Washlink.Buildings.Building

  def index(conn, _params) do
    buildings = Buildings.list_buildings()
    render(conn, "index.json", buildings: buildings)
  end

  def create(conn, %{"building" => building_params}) do
    with {:ok, %Building{} = building} <- Buildings.create_building(building_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.building_path(conn, :show, building))
      |> render("show.json", building: building)
    end
  end

  def show(conn, %{"id" => id}) do
    building = Buildings.get_building!(id)
    render(conn, "show.json", building: building)
  end

  def update(conn, %{"id" => id, "building" => building_params}) do
    building = Buildings.get_building!(id)

    with {:ok, %Building{} = building} <- Buildings.update_building(building, building_params) do
      render(conn, "show.json", building: building)
    end
  end

  def delete(conn, %{"id" => id}) do
    building = Buildings.get_building!(id)

    with {:ok, %Building{}} <- Buildings.delete_building(building) do
      send_resp(conn, :no_content, "")
    end
  end
end
