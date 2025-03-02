defmodule Whiteboard.Repo.Migrations.CreateAuditLog do
  use Ecto.Migration

  def change do
    create table(:audit_log) do
      add :audit_logs, :string
      add :action, :string
      add :details, :map
      add :board_id, references(:boards, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:audit_log, [:board_id])
    create index(:audit_log, [:user_id])
  end
end
