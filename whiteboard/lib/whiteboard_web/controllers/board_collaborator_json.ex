defmodule WhiteboardWeb.BoardCollaboratorJSON do
  alias Whiteboard.Collaborations.BoardCollaborator

  @doc """
  Renders a list of board_collaborators.
  """
  def index(%{board_collaborators: board_collaborators}) do
    %{data: for(board_collaborator <- board_collaborators, do: data(board_collaborator))}
  end

  @doc """
  Renders a single board_collaborator.
  """
  def show(%{board_collaborator: board_collaborator}) do
    %{data: data(board_collaborator)}
  end

  defp data(%BoardCollaborator{} = board_collaborator) do
    %{
      id: board_collaborator.id,
      access_type: board_collaborator.access_type
    }
  end
end
