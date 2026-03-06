local M = {}

local cache_dir = vim.fn.stdpath("state") .. "/nepes"

function M.cache_path(theme)
  return cache_dir .. "/" .. theme .. "_compiled.lua"
end

function M.compile(theme, highlights)
  vim.fn.mkdir(cache_dir, "p")
  local path = M.cache_path(theme)
  local lines = { "return {" }
  for group, attrs in pairs(highlights) do
    local parts = {}
    for k, v in pairs(attrs) do
      if type(v) == "string" then
        table.insert(parts, string.format("[%q]=%q", k, v))
      elseif type(v) == "boolean" then
        table.insert(parts, string.format("[%q]=%s", k, tostring(v)))
      end
    end
    table.insert(lines, string.format("  [%q]={%s},", group, table.concat(parts, ",")))
  end
  table.insert(lines, "}")

  local f = io.open(path, "w")
  if f then
    f:write(table.concat(lines, "\n"))
    f:close()
    -- Compile to bytecode for faster loading
    local chunk = loadfile(path)
    if chunk then
      local bytecode = string.dump(chunk)
      f = io.open(path, "wb")
      if f then
        f:write(bytecode)
        f:close()
      end
    end
  end
end

function M.load(theme)
  local path = M.cache_path(theme)
  local f = io.open(path, "r")
  if not f then
    return nil
  end
  f:close()
  local ok, data = pcall(dofile, path)
  if ok and type(data) == "table" then
    return data
  end
  return nil
end

function M.clean()
  vim.fn.delete(cache_dir, "rf")
end

return M
