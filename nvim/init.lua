require('impatient')

-- Allow hot reloading of configurations
function load(mod)
  package.loaded[mod] = nil
  require(mod)
end

load "utils"
load "options"
load "keymaps"
load "plugins"
load "lsp.init"
load "autocommands"

