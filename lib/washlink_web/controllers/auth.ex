defmodule WashlinkWeb.Auth do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)

    cond do
      # If the user is already logged in, we don't need to do anything.
      conn.assigns[:current_user] ->
        conn

      # If the user is not logged in, but they have a session, we need to
      # fetch the user from the database and assign it to the connection
      user = user_id && Washlink.Accounts.get_user(user_id) ->
        assign(conn, :current_user, user)

      # If the user is not logged in and they don't have a session, we
      # don't need to do anything.
      true ->
        assign(conn, :current_user, nil)
    end
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end
end
