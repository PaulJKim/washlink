defmodule Washlink.BookingsTest do
  use Washlink.DataCase

  alias Washlink.Bookings

  describe "bookings" do
    alias Washlink.Bookings.Booking

    import Washlink.BookingsFixtures

    @invalid_attrs %{end_time: nil, start_time: nil}

    test "list_bookings/0 returns all bookings" do
      booking = booking_fixture()
      assert Bookings.list_bookings() == [booking]
    end

    test "get_booking!/1 returns the booking with given id" do
      booking = booking_fixture()
      assert Bookings.get_booking!(booking.id) == booking
    end

    test "create_booking/1 with valid data creates a booking" do
      valid_attrs = %{end_time: ~U[2023-03-11 03:50:00Z], start_time: ~U[2023-03-11 03:50:00Z]}

      assert {:ok, %Booking{} = booking} = Bookings.create_booking(valid_attrs)
      assert booking.end_time == ~U[2023-03-11 03:50:00Z]
      assert booking.start_time == ~U[2023-03-11 03:50:00Z]
    end

    test "create_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_booking(@invalid_attrs)
    end

    test "update_booking/2 with valid data updates the booking" do
      booking = booking_fixture()
      update_attrs = %{end_time: ~U[2023-03-12 03:50:00Z], start_time: ~U[2023-03-12 03:50:00Z]}

      assert {:ok, %Booking{} = booking} = Bookings.update_booking(booking, update_attrs)
      assert booking.end_time == ~U[2023-03-12 03:50:00Z]
      assert booking.start_time == ~U[2023-03-12 03:50:00Z]
    end

    test "update_booking/2 with invalid data returns error changeset" do
      booking = booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_booking(booking, @invalid_attrs)
      assert booking == Bookings.get_booking!(booking.id)
    end

    test "delete_booking/1 deletes the booking" do
      booking = booking_fixture()
      assert {:ok, %Booking{}} = Bookings.delete_booking(booking)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_booking!(booking.id) end
    end

    test "change_booking/1 returns a booking changeset" do
      booking = booking_fixture()
      assert %Ecto.Changeset{} = Bookings.change_booking(booking)
    end
  end
end
