return {
  "folke/which-key.nvim",
  opts = {
    preset = "classic",
    show_help = true,
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
        o = false,
      },
    },
    win = {
      no_overlap = true,
      border = "single", -- none, single, double, shadow
      title = true,
      title_pos = "center",
      zindex = 1000,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 1, max = 50 }, -- min and max width of the columns
      spacing = 10, -- spacing between columns
      align = "center", -- align columns left, center or right
    },
    spec = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>ct"] = { name = "+test" },
      ["<leader>f"] = { name = "+find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>q"] = { name = "+session" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+quickfix" },
    },
    icons = {
      breadcrumb = "» ", -- symbol used in the command line area that shows your active key combo
      separator = "➜ ", -- symbol used between a key and it's label
      group = "+ ", -- symbol prepended to a group
      ellipsis = "…",
      rules = {},
      colors = false,
    },
  },
}
