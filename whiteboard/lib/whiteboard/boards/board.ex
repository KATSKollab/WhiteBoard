defmodule Whiteboard.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :data, :map
    field :title, :string
    field :owner_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:title, :data])
    |> validate_required([:title])
  end
end
