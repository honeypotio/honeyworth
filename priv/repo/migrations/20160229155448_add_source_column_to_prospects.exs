defmodule Honeyworth.Repo.Migrations.AddSourceColumnToProspects do
  use Ecto.Migration

  def change do
    alter table(:prospects) do
      add :source, :text
    end
  end
end
