M = {}

M.bindings = {
  ["a"] = { "<cmd>Alpha<cr>", "Startup Screen" },
  ["-"] = { ":split<CR>", "Horizonal Split"  },
  ['\\'] = { ":vsplit<CR>", "Vertical Split"  },

  b = {
    name = "Buffer",
    --[[ c = { "<Cmd>close<Cr>", "Close split" }, ]]
    w = { "<Cmd>bd!<Cr>", "Close current" },
    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all" },
    i = { "mpggVG=<esc>`p", "Indent" },
    c = { "<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<cr>", "Convert tabs to spaces" },
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
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    i = { "<cmd>Telescope highlights<cr>", "Highlights" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    r = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    p = { "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", "Files" },
    s = { "<cmd>lua require'telescope.builtin'.grep_string()<CR>", "Grep String" },
    t = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
    w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Blame" },

    s = { "", "Search" },
    sb = { "<cmd>Telescope advanced_git_search diff_branch_file<CR>", "Search Branches" },
    sp = { "<cmd>Telescope advanced_git_search search_log_content<CR>", "Search Previous Commits" },
    sf = { "<cmd>Telescope advanced_git_search diff_commit_file<CR>", "Search Previous Commits in File" },
    sr = { "<cmd>Telescope advanced_git_search checkout_reflog<CR>", "Search Reflog" },

    d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
    D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
    O = { "<cmd>GitConflictChooseOurs<cr>", "Conflict - Choose Ours" },
    T = { "<cmd>GitConflictChooseTheirs<cr>", "Conflict - Choose Theirs" },
    B = { "<cmd>GitConflictChooseBoth<cr>", "Conflict - Choose Both" },
    N = { "<cmd>GitConflictChooseNone<cr>", "Conflict - Choose None" },
    Q = { "<cmd>GitConflictListQf<cr>", "Conflict - Quicklist" },
    ["]"] = { "<cmd>GitConflictNextConflict<cr>", "Conflict - Goto Next" },
    ["["] = { "<cmd>GitConflictPrevConflict<cr>", "Conflict - Goto Previous" },
    l = { "<cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<cr>", "Git Link" }
  },

  m = {
    name = "Messages",
    l = { "<cmd>lua require('noice').cmd('last')<cr>", "Last Message" },
    h = { "<cmd>lua require('noice').cmd('history')<cr>", "History" },
  },

  r = {
    name = "Refactoring",
    b = { [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], "Extract Block" },
    i = { [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
  },

  s = {
    name = "Sessions",
    r = { [[<cmd>lua require("persistence").load()<cr>]], "Restore (Directory)" },
    l = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "Restore" },
    s = { [[<cmd>lua require("persistence").stop()<cr>]], "Stop" },
  },

  t = {
    name = "Terminal",
    l = { "<cmd>:lua _toggle_lazygit()<CR>", "Lazygit" },
    c = { "<cmd>:lua _toggle_console()<CR>", "Console" },
    i = { "<cmd>:lua _toggle_irb()<CR>", "IRB" },
    h = { "<cmd>:lua _toggle_htop()<CR>", "htop" },
  },

  x = {
    name = "Trouble",
    x = { "<cmd>Trouble<cr>", "Open" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
    l = { "<cmd>Trouble loclist<cr>", "Loclist" },
    q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
    r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
  },

  y = {
    name = "Yank",
    p = { "<cmd>let @+ = expand('%:p')<cr> <cmd>lua vim.notifier.info('Yanked filepath')<cr>", "Filepath" },
    a = { "<cmd>%y<cr>", "Buffer contents" },
  },

  z = {
    name = "System",
    f = { "<cmd>echo &filetype<cr>", "Filetype" },
    r = { "<cmd>luafile %<cr> <cmd>lua vim.notifier.info('Sourced file')<cr>", "Source file" },
    x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
    e = { "!!$SHELL<CR>", "Execute Shell" },
    w = { "<cmd>update!<CR>", "Save" },
    q = { "<cmd>q!<CR>", "Quit" },
  },
}

return M