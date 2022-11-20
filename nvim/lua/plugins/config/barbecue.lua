local plugin_loaded, barbecue = pcall(require, "barbecue")
if not plugin_loaded then return end

barbecue.setup({
  attach_navic = true,
  create_autocmd = true,
  include_buftypes = { "" },
  exclude_filetypes = { "toggleterm" },
  custom_section = function()
    return ""
  end,
  modifiers = {
    dirname = ":~:.",
    basename = "",
  },
  symbols = {
    separator = "̷̷̸ ̸̸ ",
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
})
