local M = {}

M.config = {
  transparent = false,
  compile = false,
  theme = "dark",
  overrides = function(colors)
    return {}
  end,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "nepes"
  vim.o.termguicolors = true
  vim.o.background = M.config.theme == "light" and "light" or "dark"

  local palette = require("nepes.palette")
  local colors = M.config.theme == "light" and palette.light or palette.dark
  local highlights = require("nepes.highlights").get(colors, M.config)
  local user = M.config.overrides(colors)
  highlights = vim.tbl_deep_extend("force", highlights, user)

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
