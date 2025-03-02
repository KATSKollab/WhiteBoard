defmodule Whiteboard.Repo.Migrations.CreateSession do
  use Ecto.Migration

  def change do
    create table(:session) do
      add :sessions, :string
      add :status, :string
      add :board_id, references(:boards, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:session, [:board_id])
    create index(:session, [:user_id])
  end
end
