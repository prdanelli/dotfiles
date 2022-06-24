local M = {}

function M.setup()
  local module_name = 'which-key'
  local whichkey = require(module_name)

  local conf = {
    window = {
      border = 'none',
      position = 'bottom',
    },
    ignore_missing = true,
  }

  local opts = {
    mode = 'n',
    prefix = '<leader>',
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  local mappings = {
    ['a'] = { "<cmd>Alpha<cr>", "Startup Screen" },

    b = {
      name = 'Buffer',
      c = { '<Cmd>bd!<Cr>', 'Close current buffer' },
      w = { '<Cmd>bd!<Cr>', 'Close current buffer' },
      D = { '<Cmd>%bd|e#|bd#<Cr>', 'Delete all buffers' },
      ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Goto Buffer 1" },
      ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "Goto Buffer 2" },
      ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "Goto Buffer 3" },
      ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "Goto Buffer 4" },
      ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "Goto Buffer 5" },
      ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "Goto Buffer 6" },
      ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "Goto Buffer 7" },
      ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "Goto Buffer 8" },
      ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "Goto Buffer 9" },
    },

    c = {
      name = "Scratch Pad",
      c = { "<cmd>ScratchPad<cr>", "Toggle" },
    },

    f = {
      name = "Find",
      a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      d = { "<cmd>Telescope find_dotfiles<cr>", "Dotfiles" },
      e = { "<cmd>RnvimrToggle<CR>", "Ranger" },
      f = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "File Browser" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      i = { "<cmd>Telescope hightlights<cr>", "Highlights" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      m = { "<cmd>Telescope marks<cr>", "Marks" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      p = { "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", "Files" },
      r = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
      w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
    },

    g = {
      name = 'GitSigns',
      b = { '<cmd>Gitsigns toggle_current_line_blame<CR>', 'Blame' }
    },

    n = {
      name = "Neotest",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run All" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },

    -- s = {
    --   name = "Search",
    --   o = { [[ <Esc><Cmd>lua require('spectre').open()<CR>]], "Open" },
    -- },

    x = {
      name = "Trouble",
      x = { "<cmd>Trouble<cr>", "Open" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
      d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
      l = { "<cmd>Trouble loclist<cr>", "Loclist" },
      q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
      r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
    },

    z = {
      name = "System",
      d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
      D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
      e = { "!!$SHELL<CR>", "Execute line" },
    },

    ['w'] = { '<cmd>update!<CR>', 'Save' },
    ['q'] = { '<cmd>q!<CR>', 'Quit' },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
