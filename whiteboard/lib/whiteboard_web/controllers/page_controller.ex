defmodule WhiteboardWeb.PageController do
  use WhiteboardWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def board(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :board, layout: false)
  end

end
