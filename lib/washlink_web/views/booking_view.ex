defmodule WashlinkWeb.BookingView do
  use WashlinkWeb, :view
  alias WashlinkWeb.BookingView

  def render("index.json", %{bookings: bookings}) do
    %{data: render_many(bookings, BookingView, "booking.json")}
  end

  def render("show.json", %{booking: booking}) do
    %{data: render_one(booking, BookingView, "booking.json")}
  end

  def render("booking.json", %{booking: booking}) do
    %{
      id: booking.id,
      start_time: booking.start_time,
      end_time: booking.end_time
    }
  end
end
