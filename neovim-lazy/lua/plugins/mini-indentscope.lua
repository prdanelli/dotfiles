return {
  "echasnovski/mini.indentscope",
  opts = {
    symbol = ":",
    options = { try_as_border = true },
  },
  config = function()
    require("mini.indentscope").gen_animation.none()
  end,
}
