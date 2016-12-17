defmodule StoryTime.Repo.Migrations.CreateReading do
  use Ecto.Migration

  def change do
    create table(:readings) do
      add :user_id, references(:users, on_delete: :nothing)
      add :book_id, references(:books, on_delete: :nothing)

      timestamps()
    end
    create index(:readings, [:user_id])
    create index(:readings, [:book_id])

  end
end
