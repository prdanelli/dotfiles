return {
  "akinsho/git-conflict.nvim",
  event = "VeryLazy",
  config = function()
    -- GitConflictChooseOurs -- Select the current changes.
    -- GitConflictChooseTheirs -- Select the incoming changes.
    -- GitConflictChooseBoth -- Select both changes.
    -- GitConflictChooseNone -- Select both none of the changes.
    -- GitConflictNextConflict -- Move to the next conflict.
    -- GitConflictPrevConflict -- Move to the previous conflict.
    -- GitConflictListQf -- Get all conflict to quickfix

    require("git-conflict").setup({
      default_mappings = false, -- disable buffer local mapping created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = "copen", -- command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    })

    vim.keymap.set("n", "<leader>go", "<cmd>GitConflictChooseOurs<cr>", { desc = "Pick [O]urs" })
    vim.keymap.set("n", "<leader>gt", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Pick [T]heirs" })
    vim.keymap.set("n", "<leader>gb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Pick [B]oth" })
    vim.keymap.set("n", "<leader>g0", "<cmd>GitConflictChooseNone<cr>", { desc = "Pick N[0]ne" })
    vim.keymap.set("n", "<leader>xc", "<cmd>GitConflictListQf<cr>", { desc = "[C]onflict - Quicklist" })
    vim.keymap.set("n", "<leader>gn", "<cmd>GitConflictNextConflict<cr>", { desc = "[N]ext Conflict" })
    vim.keymap.set("n", "<leader>gp", "<cmd>GitConflictPrevConflict<cr>", { desc = "[P]revious Conflict" })
  end,
}
