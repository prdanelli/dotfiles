local curl = require("plenary.curl")

local my_curl = function(url)
  local res = curl.get(url, { accept = "application/json" })

  return vim.json.decode(res.body)
end

-- local result = curl("https://jsonplaceholder.typicode.com/todos/1")

local download = function()
  local file = "https://media2.giphy.com/media/bEMcuOG3hXVnihvB7x/giphy.gif"
  local loc = "/tmp/giphy2.gif"
  local res = curl.get(file, { output = loc })

  return res
end

-- local result = download()
-- print(vim.inspect.inspect(result))
