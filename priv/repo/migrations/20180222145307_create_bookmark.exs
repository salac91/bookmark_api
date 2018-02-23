defmodule BookmarkApi.Repo.Migrations.CreateBookmark do
  use Ecto.Migration

  def change do
    create table(:bookmars) do
      add :user_id, references(:users)
      add :url, :string
      add :description, :text

      timestamps()
    end
  end
end
