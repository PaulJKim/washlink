defmodule Washlink.Repo.Migrations.AddBuildingIdToAmenity do
  use Ecto.Migration

  def change do
    alter table(:amenities) do
      add :building_id, references(:buildings, on_delete: :delete_all)
    end
  end
end
