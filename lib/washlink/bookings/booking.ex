defmodule Washlink.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:start_time, :end_time])
    |> validate_required([:start_time, :end_time])
  end
end
