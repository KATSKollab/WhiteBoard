defmodule Whiteboard.Collaborations do
  @moduledoc """
  The Collaborations context.
  """

  import Ecto.Query, warn: false
  alias Whiteboard.Repo

  alias Whiteboard.Collaborations.BoardCollaborator

  @doc """
  Returns the list of board_collaborators.

  ## Examples

      iex> list_board_collaborators()
      [%BoardCollaborator{}, ...]

  """
  def list_board_collaborators do
    Repo.all(BoardCollaborator)
  end

  @doc """
  Gets a single board_collaborator.

  Raises `Ecto.NoResultsError` if the Board collaborator does not exist.

  ## Examples

      iex> get_board_collaborator!(123)
      %BoardCollaborator{}

      iex> get_board_collaborator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_board_collaborator!(id), do: Repo.get!(BoardCollaborator, id)

  @doc """
  Creates a board_collaborator.

  ## Examples

      iex> create_board_collaborator(%{field: value})
      {:ok, %BoardCollaborator{}}

      iex> create_board_collaborator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_board_collaborator(attrs \\ %{}) do
    %BoardCollaborator{}
    |> BoardCollaborator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a board_collaborator.

  ## Examples

      iex> update_board_collaborator(board_collaborator, %{field: new_value})
      {:ok, %BoardCollaborator{}}

      iex> update_board_collaborator(board_collaborator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_board_collaborator(%BoardCollaborator{} = board_collaborator, attrs) do
    board_collaborator
    |> BoardCollaborator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a board_collaborator.

  ## Examples

      iex> delete_board_collaborator(board_collaborator)
      {:ok, %BoardCollaborator{}}

      iex> delete_board_collaborator(board_collaborator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_board_collaborator(%BoardCollaborator{} = board_collaborator) do
    Repo.delete(board_collaborator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board_collaborator changes.

  ## Examples

      iex> change_board_collaborator(board_collaborator)
      %Ecto.Changeset{data: %BoardCollaborator{}}

  """
  def change_board_collaborator(%BoardCollaborator{} = board_collaborator, attrs \\ %{}) do
    BoardCollaborator.changeset(board_collaborator, attrs)
  end
end
