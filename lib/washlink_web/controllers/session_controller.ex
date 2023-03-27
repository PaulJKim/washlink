defmodule WashlinkWeb.SessionController do
  use WashlinkWeb, :controller

  def create(conn, %{"username" => username, "password" => password}) do
    case Washlink.Accounts.authenticate_by_username_and_pass(username, password) do
      {:ok, user} ->
        conn
        |> WashlinkWeb.Auth.login(user)
        |> resp(200, "OK")

      {:error, :unauthorized} ->
        conn
        |> resp(401, "Unauthorized")

      {:error, :not_found} ->
        conn
        |> resp(401, "Unauthorized")
    end
  end
end
