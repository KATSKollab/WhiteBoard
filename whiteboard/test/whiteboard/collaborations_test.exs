defmodule Whiteboard.CollaborationsTest do
  use Whiteboard.DataCase

  alias Whiteboard.Collaborations

  describe "board_collaborators" do
    alias Whiteboard.Collaborations.BoardCollaborator

    import Whiteboard.CollaborationsFixtures

    @invalid_attrs %{access_type: nil}

    test "list_board_collaborators/0 returns all board_collaborators" do
      board_collaborator = board_collaborator_fixture()
      assert Collaborations.list_board_collaborators() == [board_collaborator]
    end

    test "get_board_collaborator!/1 returns the board_collaborator with given id" do
      board_collaborator = board_collaborator_fixture()
      assert Collaborations.get_board_collaborator!(board_collaborator.id) == board_collaborator
    end

    test "create_board_collaborator/1 with valid data creates a board_collaborator" do
      valid_attrs = %{access_type: "some access_type"}

      assert {:ok, %BoardCollaborator{} = board_collaborator} = Collaborations.create_board_collaborator(valid_attrs)
      assert board_collaborator.access_type == "some access_type"
    end

    test "create_board_collaborator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Collaborations.create_board_collaborator(@invalid_attrs)
    end

    test "update_board_collaborator/2 with valid data updates the board_collaborator" do
      board_collaborator = board_collaborator_fixture()
      update_attrs = %{access_type: "some updated access_type"}

      assert {:ok, %BoardCollaborator{} = board_collaborator} = Collaborations.update_board_collaborator(board_collaborator, update_attrs)
      assert board_collaborator.access_type == "some updated access_type"
    end

    test "update_board_collaborator/2 with invalid data returns error changeset" do
      board_collaborator = board_collaborator_fixture()
      assert {:error, %Ecto.Changeset{}} = Collaborations.update_board_collaborator(board_collaborator, @invalid_attrs)
      assert board_collaborator == Collaborations.get_board_collaborator!(board_collaborator.id)
    end

    test "delete_board_collaborator/1 deletes the board_collaborator" do
      board_collaborator = board_collaborator_fixture()
      assert {:ok, %BoardCollaborator{}} = Collaborations.delete_board_collaborator(board_collaborator)
      assert_raise Ecto.NoResultsError, fn -> Collaborations.get_board_collaborator!(board_collaborator.id) end
    end

    test "change_board_collaborator/1 returns a board_collaborator changeset" do
      board_collaborator = board_collaborator_fixture()
      assert %Ecto.Changeset{} = Collaborations.change_board_collaborator(board_collaborator)
    end
  end
end
