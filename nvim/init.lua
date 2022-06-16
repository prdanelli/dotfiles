local impatient_loaded, impatient = pcall(require, "impatient")
if impatient_loaded then
  impatient.enable_profile()
end

-- Allow hot reloading of configurations
_G.load = function(module)
  package.loaded[module] = nil
  return require(module)
end

load "utils"
load "options"
load "keymaps"
load "plugins"
load "lsp.init"
load "autocommands"

