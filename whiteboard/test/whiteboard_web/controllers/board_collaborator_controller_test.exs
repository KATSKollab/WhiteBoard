defmodule WhiteboardWeb.BoardCollaboratorControllerTest do
  use WhiteboardWeb.ConnCase

  import Whiteboard.CollaborationsFixtures

  alias Whiteboard.Collaborations.BoardCollaborator

  @create_attrs %{
    access_type: "some access_type"
  }
  @update_attrs %{
    access_type: "some updated access_type"
  }
  @invalid_attrs %{access_type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all board_collaborators", %{conn: conn} do
      conn = get(conn, ~p"/api/board_collaborators")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create board_collaborator" do
    test "renders board_collaborator when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/board_collaborators", board_collaborator: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/board_collaborators/#{id}")

      assert %{
               "id" => ^id,
               "access_type" => "some access_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/board_collaborators", board_collaborator: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update board_collaborator" do
    setup [:create_board_collaborator]

    test "renders board_collaborator when data is valid", %{conn: conn, board_collaborator: %BoardCollaborator{id: id} = board_collaborator} do
      conn = put(conn, ~p"/api/board_collaborators/#{board_collaborator}", board_collaborator: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/board_collaborators/#{id}")

      assert %{
               "id" => ^id,
               "access_type" => "some updated access_type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, board_collaborator: board_collaborator} do
      conn = put(conn, ~p"/api/board_collaborators/#{board_collaborator}", board_collaborator: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete board_collaborator" do
    setup [:create_board_collaborator]

    test "deletes chosen board_collaborator", %{conn: conn, board_collaborator: board_collaborator} do
      conn = delete(conn, ~p"/api/board_collaborators/#{board_collaborator}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/board_collaborators/#{board_collaborator}")
      end
    end
  end

  defp create_board_collaborator(_) do
    board_collaborator = board_collaborator_fixture()
    %{board_collaborator: board_collaborator}
  end
end
