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
  local highlights

  -- Try loading from cache if compilation is enabled
  if M.config.compile then
    local compiler = require("nepes.compile")
    highlights = compiler.load(M.config.theme)
  end

  -- Generate highlights if no cache hit
  if not highlights then
    highlights = require("nepes.highlights").get(colors, M.config)
    -- Cache for next load if compilation is enabled
    if M.config.compile then
      local compiler = require("nepes.compile")
      compiler.compile(M.config.theme, highlights)
    end
  end

  -- Apply user overrides (always, even with cached highlights)
  local user = M.config.overrides(colors)
  highlights = vim.tbl_deep_extend("force", highlights, user)

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

--- Manually recompile the highlight cache.
function M.compile()
  local palette = require("nepes.palette")
  local colors = M.config.theme == "light" and palette.light or palette.dark
  local highlights = require("nepes.highlights").get(colors, M.config)
  local compiler = require("nepes.compile")
  compiler.compile(M.config.theme, highlights)
  vim.notify("Nepes: compiled " .. M.config.theme .. " theme", vim.log.levels.INFO)
end

--- Clear the highlight cache.
function M.clean()
  require("nepes.compile").clean()
  vim.notify("Nepes: cleared compiled cache", vim.log.levels.INFO)
end

return M
