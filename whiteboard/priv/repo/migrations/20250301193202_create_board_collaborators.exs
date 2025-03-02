defmodule Whiteboard.Repo.Migrations.CreateBoardCollaborators do
  use Ecto.Migration

  def change do
    create table(:board_collaborators) do
      add :access_type, :string
      add :board_id, references(:boards, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:board_collaborators, [:board_id])
    create index(:board_collaborators, [:user_id])
  end
end
