defmodule WhiteboardWeb.BoardCollaboratorController do
  use WhiteboardWeb, :controller

  alias Whiteboard.Collaborations
  alias Whiteboard.Collaborations.BoardCollaborator

  action_fallback WhiteboardWeb.FallbackController

  def index(conn, _params) do
    board_collaborators = Collaborations.list_board_collaborators()
    render(conn, :index, board_collaborators: board_collaborators)
  end

  def create(conn, %{"board_collaborator" => board_collaborator_params}) do
    with {:ok, %BoardCollaborator{} = board_collaborator} <- Collaborations.create_board_collaborator(board_collaborator_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/board_collaborators/#{board_collaborator.id}")
      |> render(:show, board_collaborator: board_collaborator)
    end
  end

  def show(conn, %{"id" => id}) do
    board_collaborator = Collaborations.get_board_collaborator!(id)
    render(conn, :show, board_collaborator: board_collaborator)
  end

  def update(conn, %{"id" => id, "board_collaborator" => board_collaborator_params}) do
    board_collaborator = Collaborations.get_board_collaborator!(id)

    with {:ok, %BoardCollaborator{} = board_collaborator} <- Collaborations.update_board_collaborator(board_collaborator, board_collaborator_params) do
      render(conn, :show, board_collaborator: board_collaborator)
    end
  end

  def delete(conn, %{"id" => id}) do
    board_collaborator = Collaborations.get_board_collaborator!(id)

    with {:ok, %BoardCollaborator{}} <- Collaborations.delete_board_collaborator(board_collaborator) do
      send_resp(conn, :no_content, "")
    end
  end
end
