local M = {}

function M.setup()
  local module_name = "which-key"
  local whichkey = require(module_name)

  local conf = {
    show_help = false,
    ignore_missing = true,
    plugins = {
      marks = false,
      registers = false,
      presets = {
        operators = false,
        motions = false,
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
        b = false,
      },
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 0, 0, 0, 0 },
      padding = { 0, 1, 0, 1 },
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 1, max = 50 }, -- min and max width of the columns
      spacing = 10, -- spacing between columns
      align = "center", -- align columns left, center or right
   },
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
      n = { "b", }, -- Ensure b isn't used by whichkey as it slows it down a lot
    },
  }
  whichkey.setup(conf)

  local n_opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  whichkey.register(require("plugins.config/whichkey_bindings.normal_mode").bindings, n_opts)

  local v_opts = {
    mode = "v", -- Visual mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  whichkey.register(require("plugins.config/whichkey_bindings.visual_mode").bindings, v_opts)
end

return M
