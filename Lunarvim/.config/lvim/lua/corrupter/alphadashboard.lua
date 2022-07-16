local header = {
  type = "text",
  val = require("corrupter.header").dashboard(),
  opts = {
    position = "center"
  }
}
lvim.builtin.alpha.dashboard.section.header = header;
