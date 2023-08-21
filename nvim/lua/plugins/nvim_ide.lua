local plugin_loaded, ide = pcall(require, "ide")
if not plugin_loaded then return end

-- default components
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local changes         = require('ide.components.changes')
--[[ local commits         = require('ide.components.commits') ]]
local branches        = require('ide.components.branches')

ide.setup({
    -- the global icon set to use.

    icon_set = "default", -- values: "nerd", "codicon", "default"
    components = {},
    panels = {
        left = "explorer",
        right = "git"
    },
    -- panels defined by groups of components, user is free to redefine these
    -- or add more.
    panel_groups = {
        explorer = { outline.Name, explorer.Name, callhierarchy.Name },
        git = { changes.Name, timeline.Name, branches.Name }
    }
})
