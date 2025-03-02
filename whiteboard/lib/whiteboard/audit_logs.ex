defmodule Whiteboard.AuditLogs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "audit_log" do
    field :action, :string
    field :details, :map
    field :audit_logs, :string
    field :board_id, :id
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(audit_logs, attrs) do
    audit_logs
    |> cast(attrs, [:audit_logs, :action, :details])
    |> validate_required([:audit_logs, :action])
  end
end
