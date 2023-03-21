defmodule Washlink.Repo.Migrations.AddTitleToBooking do
  use Ecto.Migration

  def change do
    alter table(:bookings) do
      add :title, :string
    end
  end
end
