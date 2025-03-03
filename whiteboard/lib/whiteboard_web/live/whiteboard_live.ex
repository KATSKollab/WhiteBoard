defmodule WhiteboardWeb.WhiteboardLive do
  use WhiteboardWeb, :live_view

  def render(assigns) do
    ~H"""
    <div id="whiteboard-container">
      <canvas id="whiteboard" phx-hook="WhiteboardHook"></canvas>
      <div class="toolbar">
        <button phx-click="set_mode" phx-value-mode="draw">Draw</button>
        <button phx-click="set_mode" phx-value-mode="erase">Erase</button>
        <input type="color" phx-change="set_color" phx-value-color={@color} />
        <button phx-click="clear">Clear</button>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, color: "#000000", mode: "draw")}
  end

  def handle_event("set_mode", %{"mode" => mode}, socket) do
    {:noreply, assign(socket, :mode, mode)}
  end

  def handle_event("set_color", %{"color" => color}, socket) do
    {:noreply, assign(socket, :color, color)}
  end

  def handle_event("clear", _params, socket) do
    send(self(), :clear_canvas)
    {:noreply, socket}
  end

  def handle_info(:clear_canvas, socket) do
    push_event(socket, "clear_canvas", %{})
    {:noreply, socket}
  end
end
