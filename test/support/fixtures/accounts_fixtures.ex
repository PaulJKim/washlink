defmodule Washlink.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Washlink.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        password: "some password",
        password_hash: "some password_hash"
      })
      |> Washlink.Accounts.create_user()

    user
  end
end
