defmodule WashlinkWeb.PageController do
  use WashlinkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
