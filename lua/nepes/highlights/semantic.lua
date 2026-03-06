local M = {}

---@param c table Palette colors
---@param config table Plugin configuration
---@return table LSP semantic highlight groups
function M.get(c, config)
  return {
    -- LSP semantic token types
    ["@lsp.type.class"] = { link = "Type" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.enum"] = { link = "Type" },
    ["@lsp.type.enumMember"] = { link = "Constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "Type" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "Type" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { fg = c.magenta, italic = true },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
    ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
    ["@lsp.type.magicFunction"] = { link = "@function.builtin" },
    ["@lsp.type.lifetime"] = { link = "Operator" },

    -- LSP semantic token modifiers
    ["@lsp.mod.readonly"] = { link = "Constant" },
    ["@lsp.mod.typeHint"] = { link = "Type" },
    ["@lsp.mod.defaultLibrary"] = { link = "Special" },
    ["@lsp.mod.deprecated"] = { strikethrough = true },

    -- LSP combined type.modifier
    ["@lsp.typemod.operator.controlFlow"] = { fg = c.red, bold = true },
    ["@lsp.typemod.variable.global"] = { link = "Constant" },
    ["@lsp.typemod.variable.static"] = { link = "Constant" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "Special" },
    ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.function.readonly"] = { fg = c.cyan, bold = true },
  }
end

return M
