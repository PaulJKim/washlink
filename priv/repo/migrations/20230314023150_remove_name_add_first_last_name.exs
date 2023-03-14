defmodule Washlink.Repo.Migrations.RemoveNameAddFirstLastName do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :name
      add :first_name, :string
      add :last_name, :string
    end
  end
end
