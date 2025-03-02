defmodule Whiteboard.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :title, :string
      add :data, :map
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:boards, [:owner_id])
  end
end
