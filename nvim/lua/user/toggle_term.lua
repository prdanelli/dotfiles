local M = {}

function M.toggle()
  local term = vim.call('expand','<cword>')
  local toggleable_terms = {
    ['true'] = 'false',
    ['false'] = 'true',
    ['yes'] = 'no',
    ['no'] = 'yes',
  }

  local toggled = toggleable_terms[term]
  if not toggled then
    return
  end

  vim.cmd('normal! "_diwa' .. toggled)
end

return M

