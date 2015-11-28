defmodule Honeyworth.Repo.Migrations.CreateProspect do
  use Ecto.Migration

  def change do
    create table(:prospects) do
      add :name, :string
      add :email, :string
      add :profile_link, :string
      add :dev_link, :string

      timestamps
    end

  end
end
