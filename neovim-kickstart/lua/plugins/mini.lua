return {
  "echasnovski/mini.nvim",
  config = function()
    local ai = require "mini.ai"

    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    ai.setup({
      n_lines = 500,
      custom_textobjects = {
        -- Code block
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
        -- Function
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        -- Class
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        -- Tags
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        -- Digits
        d = { "%f[%d]%d+" },
        -- Word with case
        e = {
          { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
          "^().*()$",
        },
        g = function()
          local start_line, end_line = 1, vim.fn.line "$"
          local to_col = math.max(vim.fn.getline(end_line):len(), 1)

          return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
        end,
        -- Usage
        u = ai.gen_spec.function_call(),
        -- Without dot in function name
        U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
      },
    })

    require("mini.move").setup({
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",

        -- Move current line in Normal mode
        -- line_left = "<M-h>",
        -- line_right = "<M-l>",
        -- line_down = "<M-j>",
        -- line_up = "<M-k>",
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    })

    require("mini.pairs").setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']

    -- require("mini.surround").setup({
    --   -- Add custom surroundings to be used on top of builtin ones. For more
    --   -- information with examples, see `:h MiniSurround.config`.
    --   custom_surroundings = nil,
    --
    --   -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    --   highlight_duration = 200,
    --
    --   -- Module mappings. Use `''` (empty string) to disable one.
    --   mappings = {
    --     add = "sa", -- Add surrounding in Normal and Visual modes
    --     delete = "sd", -- Delete surrounding
    --     find = "sf", -- Find surrounding (to the right)
    --     find_left = "sF", -- Find surrounding (to the left)
    --     highlight = "sh", -- Highlight surrounding
    --     replace = "sr", -- Replace surrounding
    --     update_n_lines = "sn", -- Update `n_lines`
    --
    --     suffix_last = "", -- Suffix to search with "prev" method
    --     suffix_next = "", -- Suffix to search with "next" method
    --   },
    --
    --   -- Number of lines within which surrounding is searched
    --   n_lines = 20,
    --
    --   -- Whether to respect selection type:
    --   -- - Place surroundings on separate lines in linewise mode.
    --   -- - Place surroundings on each line in blockwise mode.
    --   respect_selection_type = false,
    --
    --   -- How to search for surrounding (first inside current line, then inside
    --   -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    --   -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
    --   -- see `:h MiniSurround.config`.
    --   search_method = "cover_or_nearest",
    --
    --   -- Whether to disable showing non-error feedback
    --   -- This also affects (purely informational) helper messages shown after
    --   -- idle time if user input is required.
    --   silent = false,
    -- })
    --
    -- -- if 'timeoutlen' is low enough to cause occasional usage of |s| key disable it with the following call
    -- vim.keymap.set({ "n", "x" }, "s", "<Nop>")
  end,
}
