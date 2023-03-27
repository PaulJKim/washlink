defmodule WashlinkWeb.UserController do
  use WashlinkWeb, :controller

  alias Washlink.Accounts
  alias Washlink.Accounts.User

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        IO.inspect(user)
        resp(conn, 200, "Created")

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        resp(conn, 400, "Bad Request")
    end
  end
end
