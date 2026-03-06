local M = {}

---@param c table Palette colors
---@param config table Plugin configuration
---@return table Syntax highlight groups
function M.get(c, config)
  -- Rainbow heading colors cycle
  local heading_colors = { c.blue, c.magenta, c.cyan, c.green, c.orange, c.red, c.yellow, c.blue_bright }

  return {
    -- Traditional vim syntax groups
    Comment        = { fg = c.comment, italic = true },
    Constant       = { fg = c.orange },
    String         = { fg = c.green },
    Character      = { fg = c.green },
    Number         = { fg = c.orange },
    Boolean        = { fg = c.orange },
    Float          = { fg = c.orange },

    Identifier     = { fg = c.fg },
    Function       = { fg = c.cyan },

    Statement      = { fg = c.blue },
    Conditional    = { fg = c.blue },
    Repeat         = { fg = c.blue },
    Label          = { fg = c.blue },
    Operator       = { fg = c.fg_subtle },
    Keyword        = { fg = c.blue },
    Exception      = { fg = c.blue },

    PreProc        = { fg = c.magenta_dim },
    Include        = { fg = c.magenta_dim },
    Define         = { fg = c.magenta_dim },
    Macro          = { fg = c.magenta_dim },
    PreCondit      = { fg = c.magenta_dim },

    Type           = { fg = c.magenta },
    StorageClass   = { fg = c.blue },
    Structure      = { fg = c.magenta },
    Typedef        = { fg = c.magenta },

    Special        = { fg = c.orange },
    SpecialChar    = { fg = c.orange },
    Tag            = { fg = c.blue },
    Delimiter      = { fg = c.fg_subtle },
    SpecialComment = { fg = c.comment, bold = true },
    Debug          = { fg = c.orange },

    Error          = { fg = c.red },
    Todo           = { fg = c.orange, bold = true },

    -- Underlined & Ignore
    Underlined     = { fg = c.blue, underline = true },
    Ignore         = { fg = c.fg_muted },

    -- Treesitter highlights
    -- Keywords
    ["@keyword"]                = { fg = c.blue },
    ["@keyword.function"]       = { fg = c.blue },
    ["@keyword.operator"]       = { fg = c.blue },
    ["@keyword.import"]         = { fg = c.magenta_dim },
    ["@keyword.return"]         = { fg = c.red, bold = true },
    ["@keyword.exception"]      = { fg = c.red, bold = true },
    ["@keyword.conditional"]    = { fg = c.blue },
    ["@keyword.repeat"]         = { fg = c.blue },
    ["@keyword.storage"]        = { fg = c.blue },
    ["@keyword.directive"]      = { fg = c.magenta_dim },
    ["@keyword.coroutine"]      = { fg = c.blue },

    -- Functions
    ["@function"]               = { fg = c.cyan },
    ["@function.call"]          = { fg = c.cyan },
    ["@function.builtin"]       = { fg = c.blue_bright },
    ["@function.method"]        = { fg = c.cyan },
    ["@function.method.call"]   = { fg = c.cyan },
    ["@function.macro"]         = { fg = c.magenta_dim },

    -- Variables
    ["@variable"]               = { fg = c.fg },
    ["@variable.builtin"]       = { fg = c.red, italic = true },
    ["@variable.parameter"]     = { fg = c.fg_dim },
    ["@variable.member"]        = { fg = c.fg_dim },

    -- Strings & literals
    ["@string"]                 = { fg = c.green },
    ["@string.escape"]          = { fg = c.orange, bold = true },
    ["@string.regex"]           = { fg = c.orange },
    ["@string.special"]         = { fg = c.green_dim },
    ["@string.special.symbol"]   = { fg = c.cyan },
    ["@string.special.url"]      = { fg = c.blue_bright, underline = true },
    ["@string.documentation"]   = { fg = c.comment },
    ["@character"]              = { fg = c.green },
    ["@character.special"]      = { fg = c.orange },

    -- Types
    ["@type"]                   = { fg = c.magenta },
    ["@type.builtin"]           = { fg = c.magenta_dim },
    ["@type.definition"]        = { fg = c.magenta },
    ["@type.qualifier"]         = { fg = c.blue },

    -- Constants & numbers
    ["@constant"]               = { fg = c.orange },
    ["@constant.builtin"]       = { fg = c.orange_bright },
    ["@constant.macro"]         = { fg = c.orange },
    ["@number"]                 = { fg = c.orange },
    ["@number.float"]           = { fg = c.orange },
    ["@boolean"]                = { fg = c.orange },

    -- Properties, fields, parameters (legacy names)
    ["@parameter"]              = { fg = c.fg_dim },
    ["@property"]               = { fg = c.fg_dim },
    ["@field"]                  = { fg = c.fg_dim },

    -- Operators & punctuation
    ["@operator"]               = { fg = c.fg_subtle },
    ["@punctuation"]            = { fg = c.fg_subtle },
    ["@punctuation.bracket"]    = { fg = c.fg_subtle },
    ["@punctuation.delimiter"]  = { fg = c.fg_subtle },
    ["@punctuation.special"]    = { fg = c.fg_subtle },

    -- Comments
    ["@comment"]                = { fg = c.comment, italic = true },
    ["@comment.documentation"]  = { fg = c.comment, italic = true },
    ["@comment.todo"]           = { fg = c.bg, bg = c.cyan, bold = true },
    ["@comment.note"]           = { fg = c.bg, bg = c.blue, bold = true },
    ["@comment.warning"]        = { fg = c.bg, bg = c.orange, bold = true },
    ["@comment.error"]          = { fg = c.bg, bg = c.red, bold = true },

    -- Tags (HTML/JSX)
    ["@tag"]                    = { fg = c.blue },
    ["@tag.attribute"]          = { fg = c.cyan },
    ["@tag.delimiter"]          = { fg = c.fg_subtle },
    ["@tag.builtin"]            = { fg = c.blue },

    -- Constructors & namespaces
    ["@constructor"]            = { fg = c.magenta },
    ["@namespace"]              = { fg = c.magenta_dim },
    ["@module"]                 = { fg = c.magenta_dim },

    -- Labels & misc
    ["@label"]                  = { fg = c.blue },
    ["@attribute"]              = { fg = c.magenta_dim },
    ["@attribute.builtin"]      = { fg = c.magenta_dim },

    -- Text / markup (legacy @text.* names)
    ["@text"]                   = { fg = c.fg },
    ["@text.title"]             = { fg = c.blue, bold = true },
    ["@text.title.1"]           = { fg = heading_colors[1], bold = true },
    ["@text.title.2"]           = { fg = heading_colors[2], bold = true },
    ["@text.title.3"]           = { fg = heading_colors[3], bold = true },
    ["@text.title.4"]           = { fg = heading_colors[4], bold = true },
    ["@text.title.5"]           = { fg = heading_colors[5], bold = true },
    ["@text.title.6"]           = { fg = heading_colors[6], bold = true },
    ["@text.literal"]           = { fg = c.green },
    ["@text.reference"]         = { fg = c.blue, underline = true },
    ["@text.uri"]               = { fg = c.cyan, underline = true },
    ["@text.emphasis"]          = { italic = true },
    ["@text.strong"]            = { bold = true },
    ["@text.strike"]            = { strikethrough = true },
    ["@text.todo"]              = { fg = c.orange, bold = true },
    ["@text.note"]              = { fg = c.blue, bold = true },
    ["@text.warning"]           = { fg = c.orange, bold = true },
    ["@text.danger"]            = { fg = c.red, bold = true },
    ["@text.diff.add"]          = { fg = c.green },
    ["@text.diff.delete"]       = { fg = c.red },
    ["@text.math"]              = { fg = c.cyan },
    ["@text.environment"]       = { fg = c.magenta_dim },
    ["@text.environment.name"]  = { fg = c.magenta },

    -- Markup (new @markup.* names, Neovim 0.10+)
    ["@markup"]                   = { fg = c.fg },
    ["@markup.heading"]           = { fg = c.blue, bold = true },
    ["@markup.heading.1"]         = { fg = heading_colors[1], bold = true },
    ["@markup.heading.2"]         = { fg = heading_colors[2], bold = true },
    ["@markup.heading.3"]         = { fg = heading_colors[3], bold = true },
    ["@markup.heading.4"]         = { fg = heading_colors[4], bold = true },
    ["@markup.heading.5"]         = { fg = heading_colors[5], bold = true },
    ["@markup.heading.6"]         = { fg = heading_colors[6], bold = true },
    ["@markup.italic"]            = { italic = true },
    ["@markup.strong"]            = { bold = true },
    ["@markup.strikethrough"]     = { strikethrough = true },
    ["@markup.underline"]         = { underline = true },
    ["@markup.raw"]               = { fg = c.green },
    ["@markup.raw.block"]         = { fg = c.green },
    ["@markup.link"]              = { fg = c.blue },
    ["@markup.link.label"]        = { fg = c.blue, underline = true },
    ["@markup.link.url"]          = { fg = c.cyan, underline = true },
    ["@markup.list"]              = { fg = c.fg_subtle },
    ["@markup.list.checked"]      = { fg = c.green },
    ["@markup.list.unchecked"]    = { fg = c.fg_muted },
    ["@markup.math"]              = { fg = c.cyan },
    ["@markup.environment"]       = { fg = c.magenta_dim },
    ["@markup.environment.name"]  = { fg = c.magenta },
    ["@markup.quote"]             = { fg = c.fg_dim, italic = true },

    -- Diff (treesitter)
    ["@diff.plus"]                = { fg = c.green },
    ["@diff.minus"]               = { fg = c.red },
    ["@diff.delta"]               = { fg = c.yellow },
  }
end

return M
