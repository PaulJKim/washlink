defmodule Washlink.Repo.Migrations.CreateBuildings do
  use Ecto.Migration

  def change do
    create table(:buildings) do
      add :address, :string
      add :type, :string

      timestamps()
    end
  end
end
