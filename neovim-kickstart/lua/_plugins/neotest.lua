return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "olimorris/neotest-rspec",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function(_, opts)
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          return diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        end,
      },
    }, vim.api.nvim_create_namespace("neotest"))

    opts.diagnostic = {
      enabled = true,
      severity = 1,
    }

    opts.quickfix = {
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    }

    opts.status = {
      enabled = true,
      signs = true,
      virtual_text = true,
    }

    opts.adapters = {
      require("neotest-rspec"),
    }

    require("neotest").setup(opts)
  end,
 -- stylua: ignore
  keys = {
    { "<leader>ctf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run: File" },
    { "<leader>ctF", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run: Suite" },
    { "<leader>ctc", function() require("neotest").run.run() end, desc = "Run: Closest" },
    { "<leader>cta", function() require("neotest").run.attach() end, desc = "Attach" },
    { "<leader>ctl", function() require("neotest").run.run_last() end, desc = "Run: Last" },
    { "<leader>cts", function() require("neotest").summary.toggle() end, desc = "Show: Summary" },
    { "<leader>cto", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show: Output" },
    { "<leader>ctO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>ctx", function() require("neotest").run.stop() end, desc = "Stop" },
  },
}
