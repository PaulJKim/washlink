defmodule Washlink.Repo do
  use Ecto.Repo,
    otp_app: :washlink,
    adapter: Ecto.Adapters.Postgres
end
