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

    require("mini.splitjoin").setup()
  end,
}
