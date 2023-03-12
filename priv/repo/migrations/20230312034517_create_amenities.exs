defmodule Washlink.Repo.Migrations.CreateAmenities do
  use Ecto.Migration

  def change do
    create table(:amenities) do
      add :type, :string

      timestamps()
    end
  end
end
