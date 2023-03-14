defmodule Washlink.Repo.Migrations.AddAmenityIdToBooking do
  use Ecto.Migration

  def change do
    alter table(:bookings) do
      add :amenity_id, references(:amenities)
      add :user_id, references(:users)
    end
  end
end
