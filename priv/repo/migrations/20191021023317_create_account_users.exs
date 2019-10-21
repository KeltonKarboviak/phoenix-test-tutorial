defmodule Hello.Repo.Migrations.CreateAccountUsers do
  use Ecto.Migration

  def change do
    create table(:account_users) do
      add :name, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:account_users, [:email])
  end
end
