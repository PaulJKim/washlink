defmodule Washlink.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime

      timestamps()
    end
  end
end
