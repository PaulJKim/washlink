defmodule WashlinkWeb.BookingControllerTest do
  use WashlinkWeb.ConnCase

  import Washlink.BookingsFixtures

  alias Washlink.Bookings.Booking

  @create_attrs %{
    end_time: ~U[2023-03-11 03:50:00Z],
    start_time: ~U[2023-03-11 03:50:00Z]
  }
  @update_attrs %{
    end_time: ~U[2023-03-12 03:50:00Z],
    start_time: ~U[2023-03-12 03:50:00Z]
  }
  @invalid_attrs %{end_time: nil, start_time: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bookings", %{conn: conn} do
      conn = get(conn, Routes.booking_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create booking" do
    test "renders booking when data is valid", %{conn: conn} do
      conn = post(conn, Routes.booking_path(conn, :create), booking: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.booking_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end_time" => "2023-03-11T03:50:00Z",
               "start_time" => "2023-03-11T03:50:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.booking_path(conn, :create), booking: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update booking" do
    setup [:create_booking]

    test "renders booking when data is valid", %{conn: conn, booking: %Booking{id: id} = booking} do
      conn = put(conn, Routes.booking_path(conn, :update, booking), booking: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.booking_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end_time" => "2023-03-12T03:50:00Z",
               "start_time" => "2023-03-12T03:50:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, booking: booking} do
      conn = put(conn, Routes.booking_path(conn, :update, booking), booking: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete booking" do
    setup [:create_booking]

    test "deletes chosen booking", %{conn: conn, booking: booking} do
      conn = delete(conn, Routes.booking_path(conn, :delete, booking))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.booking_path(conn, :show, booking))
      end
    end
  end

  defp create_booking(_) do
    booking = booking_fixture()
    %{booking: booking}
  end
end
