return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruby",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "solargraph",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
          end,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = false,
    dependencies = {
      "olimorris/neotest-rspec",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = function()
            return vim.tbl_flatten({ "bundle", "exec", "rspec" })
          end,
        },
      },
    },
    keys = {
      {
        "<leader>ctn",
        function()
          require("neotest").run.run()
        end,
        desc = "Test: Nearest",
      },
      {
        "<leader>cta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Test: Attach",
      },
      {
        "<leader>cts",
        function()
          require("neotest").run.stop()
        end,
        desc = "Test: Stop",
      },
      {
        "<leader>ctf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test: File",
      },
    },
  },
}
