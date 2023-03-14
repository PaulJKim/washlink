defmodule Washlink.Repo.Migrations.AddBuildingIdToUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :building_id, :integer
    end
  end
end
