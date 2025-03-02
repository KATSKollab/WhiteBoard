defmodule Whiteboard.CollaborationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Whiteboard.Collaborations` context.
  """

  @doc """
  Generate a board_collaborator.
  """
  def board_collaborator_fixture(attrs \\ %{}) do
    {:ok, board_collaborator} =
      attrs
      |> Enum.into(%{
        access_type: "some access_type"
      })
      |> Whiteboard.Collaborations.create_board_collaborator()

    board_collaborator
  end
end
