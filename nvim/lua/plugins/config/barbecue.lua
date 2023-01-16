local plugin_loaded, barbecue = pcall(require, "barbecue")
if not plugin_loaded then return end

local colors = require("config.colors").colors

barbecue.setup({
  attach_navic = true,
  create_autocmd = true,
  include_buftypes = { "" },
  exclude_filetypes = { "toggleterm" },
  custom_section = function() return "" end,
  modifiers = {
    dirname = ":~:.",
    basename = "",
  },
  symbols = {
    separator = "̷̷̸  ",
    modified = false,
    default_context = "…",
  },
  kinds = {
    File = "",
    Package = "",
    Module = "",
    Namespace = "",
    Macro = "",
    Class = "",
    Constructor = "",
    Field = "",
    Property = "",
    Method = "",
    Struct = "",
    Event = "",
    Interface = "",
    Enum = "",
    EnumMember = "",
    Constant = "",
    Function = "",
    TypeParameter = "",
    Variable = "",
    Operator = "",
    Null = "",
    Boolean = "",
    Number = "",
    String = "",
    Key = "",
    Array = "",
    Object = "",
  },
  theme = {
    normal = { fg = colors.grey10 },

    -- these highlights correspond to symbols table from config
    ellipsis = { fg = colors.grey12 },
    separator = { fg = colors.grey11 },
    modified = { fg = colors.grey11 },

    -- these highlights represent the _text_ of three main parts of barbecue
    dirname = { fg = "#737aa2" },
    basename = { bold = true },
    context = {},

    -- these highlights are used for context/navic icons
    context_file = { fg = colors.magenta },
    context_module = { fg = colors.magenta },
    context_namespace = { fg = colors.magenta },
    context_package = { fg = colors.magenta },
    context_class = { fg = colors.magenta },
    context_method = { fg = colors.magenta },
    context_property = { fg = colors.magenta },
    context_field = { fg = colors.magenta },
    context_constructor = { fg = colors.magenta },
    context_enum = { fg = colors.magenta },
    context_interface = { fg = colors.magenta },
    context_function = { fg = colors.magenta },
    context_variable = { fg = colors.magenta },
    context_constant = { fg = colors.magenta },
    context_string = { fg = colors.magenta },
    context_number = { fg = colors.magenta },
    context_boolean = { fg = colors.magenta },
    context_array = { fg = colors.magenta },
    context_object = { fg = colors.magenta },
    context_key = { fg = colors.magenta },
    context_null = { fg = colors.magenta },
    context_enum_member = { fg = colors.magenta },
    context_struct = { fg = colors.magenta },
    context_event = { fg = colors.magenta },
    context_operator = { fg = colors.magenta },
    context_type_parameter = { fg = colors.magenta },
  },
})
