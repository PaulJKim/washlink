defmodule WashlinkWeb.HelloController do
  use WashlinkWeb, :controller

  def index(conn, _params) do
    resp(conn, 200, "Hello World!")
  end
end
