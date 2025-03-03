let Hooks = {}

Hooks.WhiteboardHook = {
  mounted() {
    const canvas = this.el;
    const ctx = canvas.getContext("2d");

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    let drawing = false;
    let mode = "draw";
    let color = "#000000";

    this.handleEvent("set_mode", ({ mode: newMode }) => {
      mode = newMode;
    });

    this.handleEvent("set_color", ({ color: newColor }) => {
      color = newColor;
    });

    this.handleEvent("clear_canvas", () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
    });

    canvas.addEventListener("mousedown", (e) => {
      drawing = true;
      ctx.beginPath();
      ctx.moveTo(e.clientX, e.clientY);
    });

    canvas.addEventListener("mousemove", (e) => {
      if (!drawing) return;
      ctx.lineTo(e.clientX, e.clientY);
      ctx.strokeStyle = mode === "erase" ? "#FFFFFF" : color;
      ctx.lineWidth = mode === "erase" ? 20 : 2;
      ctx.stroke();
    });

    canvas.addEventListener("mouseup", () => {
      drawing = false;
      ctx.closePath();
    });
  }
};

export default Hooks;
