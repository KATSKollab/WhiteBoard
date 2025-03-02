defmodule Whiteboard.Collaborations.BoardCollaborator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "board_collaborators" do
    field :access_type, :string
    field :board_id, :id
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(board_collaborator, attrs) do
    board_collaborator
    |> cast(attrs, [:access_type])
    |> validate_required([:access_type])
  end
end
