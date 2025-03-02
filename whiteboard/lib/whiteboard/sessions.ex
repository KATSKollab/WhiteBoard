defmodule Whiteboard.Sessions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "session" do
    field :status, :string
    field :sessions, :string
    field :board_id, :id
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(sessions, attrs) do
    sessions
    |> cast(attrs, [:sessions, :status])
    |> validate_required([:sessions, :status])
  end
end
