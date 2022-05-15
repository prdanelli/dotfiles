local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    show_buffer_icons = false,
    show_tab_indicators = false,
    show_buffer_close_icons = false,
    show_close_icon = true,
    persist_buffer_sort = false,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    separator_style = "none",
    indicator_icon = "│",
    offsets = { { filetype = "NvimTree", text = "" } },
    sort_by = "id",
  },
})

local opts = { silent = true }

vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

vim.keymap.set("n", "tn", "<cmd>BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "tm", "<cmd>BufferLineMoveNext<CR>", opts)
vim.keymap.set("n", "te", "<cmd>BufferLineSortByExtension<CR>", opts)
vim.keymap.set("n", "td", "<cmd>BufferLineSortByDirectory<CR>", opts)
