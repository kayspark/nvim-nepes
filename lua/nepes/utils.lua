local M = {}

--- Blend two hex colors together.
---@param fg string Foreground hex color (e.g., "#ff0000")
---@param bg string Background hex color (e.g., "#000000")
---@param alpha number Blend factor (0.0 = all bg, 1.0 = all fg)
---@return string Blended hex color
function M.blend(fg, bg, alpha)
  local function hex2rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  end

  local r1, g1, b1 = hex2rgb(fg)
  local r2, g2, b2 = hex2rgb(bg)
  local r = math.floor(r1 * alpha + r2 * (1 - alpha))
  local g = math.floor(g1 * alpha + g2 * (1 - alpha))
  local b = math.floor(b1 * alpha + b2 * (1 - alpha))
  return string.format("#%02x%02x%02x", r, g, b)
end

return M
