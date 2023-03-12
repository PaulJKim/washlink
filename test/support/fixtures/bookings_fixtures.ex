defmodule Washlink.BookingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Washlink.Bookings` context.
  """

  @doc """
  Generate a booking.
  """
  def booking_fixture(attrs \\ %{}) do
    {:ok, booking} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2023-03-11 03:50:00Z],
        start_time: ~U[2023-03-11 03:50:00Z]
      })
      |> Washlink.Bookings.create_booking()

    booking
  end
end
