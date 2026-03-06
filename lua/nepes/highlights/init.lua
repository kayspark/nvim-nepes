local M = {}

--- Aggregate highlight groups from all submodules.
---@param c table Palette colors
---@param config table Plugin configuration
---@return table Merged highlight groups
function M.get(c, config)
  local highlights = {}
  local modules = { "editor", "syntax", "semantic", "lsp", "plugins" }

  for _, mod in ipairs(modules) do
    local ok, h = pcall(require, "nepes.highlights." .. mod)
    if ok then
      highlights = vim.tbl_deep_extend("force", highlights, h.get(c, config))
    end
  end

  return highlights
end

return M
