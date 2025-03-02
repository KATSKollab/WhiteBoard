defmodule Whiteboard.BoardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Whiteboard.Boards` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        data: %{},
        title: "some title"
      })
      |> Whiteboard.Boards.create_board()

    board
  end
end
