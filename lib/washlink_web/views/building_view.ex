defmodule WashlinkWeb.BuildingView do
  use WashlinkWeb, :view
  alias WashlinkWeb.BuildingView

  def render("index.json", %{buildings: buildings}) do
    %{data: render_many(buildings, BuildingView, "building.json")}
  end

  def render("show.json", %{building: building}) do
    %{data: render_one(building, BuildingView, "building.json")}
  end

  def render("building.json", %{building: building}) do
    %{
      id: building.id,
      address: building.address,
      type: building.type
    }
  end
end
