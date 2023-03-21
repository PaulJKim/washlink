defmodule Washlink.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    field :title, :string

    belongs_to :amenity, Washlink.Amenities.Amenity
    belongs_to :user, Washlink.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:start_time, :end_time, :title])
    |> validate_required([:start_time, :end_time])
  end
end
