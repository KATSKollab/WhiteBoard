defmodule WhiteboardWeb.BoardController do
  use WhiteboardWeb, :controller

  alias Whiteboard.Boards
  alias Whiteboard.Boards.Board

  action_fallback WhiteboardWeb.FallbackController

  def index(conn, _params) do
    boards = Boards.list_boards()
    render(conn, :index, boards: boards)
  end

  def create(conn, %{"board" => board_params}) do
    with {:ok, %Board{} = board} <- Boards.create_board(board_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/boards/#{board.id}")
      |> render(:show, board: board)
    end
  end

  def show(conn, %{"id" => id}) do
    board = Boards.get_board!(id)
    render(conn, :show, board: board)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Boards.get_board!(id)

    with {:ok, %Board{} = board} <- Boards.update_board(board, board_params) do
      render(conn, :show, board: board)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Boards.get_board!(id)

    with {:ok, %Board{}} <- Boards.delete_board(board) do
      send_resp(conn, :no_content, "")
    end
  end
end
