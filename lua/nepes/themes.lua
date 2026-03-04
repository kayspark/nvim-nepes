-- Theme resolution is handled directly by palette.lua.
-- This module exists for potential future theme variants (e.g., "storm", "dragon").

local M = {}

--- Return the palette for the given theme name.
---@param name string Theme name ("dark" or "light")
---@return table Palette colors
function M.get(name)
  local palette = require("nepes.palette")
  if name == "light" then
    return palette.light
  end
  return palette.dark
end

return M
