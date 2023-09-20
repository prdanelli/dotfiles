-- https://alpha2phi.medium.com/faster-neovim-plugin-development-with-plenary-nvim-e5ba8dcd12a3

local popup = require("plenary.popup")

-- Default
local function default_popup()
  local win_id = popup.create({
    "item 1",
    "item 2",
  }, {})
  print(win_id)
end

vim.cmd [[highlight PopupColor ctermbg=black ctermfg=blue guifg=blue guibg=green]]

local function highlight_popup()
  local win_id = popup.create({
    "item 1",
    "item 2",
    "item 3",
  }, {
    line = 15,
    col = 45,
    minwidth = 20,
    border = true,
    hightlight = "PopupColor"
  })
  print(win_id)
end

local function create_border_popup(borderchars)
  local _, config = popup.create("popup with custom border", {
    line = 8,
    col = 55,
    padding = { 0, 3, 0, 3 },
    borderchars = borderchars,
  })

  local border_id = config.border.win_id
  local border_bufnr = vim.api.nvim_win_get_buf(border_id)

  print(border_id)
  print(border_bufnr)
end
-- create_border_popup { "=" }

local Job = require "plenary.job"

local function sync_job()
  local job = Job:new {
    command = "ls",
    args = { "-l" },
  }

  job:sync()
  print(vim.inspect.inspect(job:result()))
end

local function callback_job()
  local stdout_results = {}
  local job = Job:new {
    command = "ls",
    args = { "/" },
    on_stdout = function(_, line)
      table.insert(stdout_results, line)
    end,
  }
  job:sync()
  print(vim.inspect.inspect(stdout_results))
end
-- callback_job()

local function chained_jobs()
  local results = {}

  local first_job = Job:new {
    command = "env",
    env = { ["a"] = "1" },
    on_stdout = function(_, line)
      print "first job"
      table.insert(results, line)
    end,
  }

  local second_job = Job:new {
    command = "env",
    env = { ["b"] = "2" },
    on_stdout = function(_, line)
      print "second job"
      table.insert(results, line)
    end,
  }

  local third_job = Job:new {
    command = "echo",
    args = { "-e", "hello world" },
    on_stdout = function(_, line)
      print "third job"
      table.insert(results, line)
    end,
  }

  local fourth_job = Job:new {
    command = "env",
    env = { ["c"] = "3" },
    on_stdout = function(_, line)
      print "fourth job"
      table.insert(results, line)
    end,
  }

  first_job:and_then(second_job)
  second_job:and_then(third_job)
  third_job:and_then(fourth_job)

  first_job:sync()
  second_job:wait()
  third_job:wait()
  fourth_job:wait()

  print(vim.inspect.inspect(results))
end

chained_jobs()
