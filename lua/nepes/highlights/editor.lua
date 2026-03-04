local M = {}

---@param c table Palette colors
---@param config table Plugin configuration
---@return table Editor highlight groups
function M.get(c, config)
  local transparent = config.transparent
  local bg = transparent and c.none or c.bg
  local bg_float = transparent and c.none or c.bg_dim
  local bg_sign = transparent and c.none or c.bg

  return {
    -- Base
    Normal       = { fg = c.fg, bg = bg },
    NormalNC     = { fg = c.fg, bg = bg },
    NormalFloat  = { fg = c.fg, bg = bg_float },
    FloatBorder  = { fg = c.border, bg = bg_float },
    FloatTitle   = { fg = c.blue, bg = bg_float, bold = true },

    -- Cursor
    Cursor       = { fg = c.bg, bg = c.fg },
    lCursor      = { link = "Cursor" },
    CursorIM     = { link = "Cursor" },
    CursorLine   = { bg = c.bg_dim },
    CursorLineNr = { fg = c.orange, bold = true },
    CursorColumn = { bg = c.bg_dim },
    ColorColumn  = { bg = c.bg_dim },

    -- Selection
    Visual       = { bg = c.selection },
    VisualNOS    = { bg = c.selection },

    -- Search
    Search       = { fg = c.bg, bg = c.orange },
    IncSearch    = { fg = c.bg, bg = c.orange_bright },
    CurSearch    = { fg = c.bg, bg = c.orange_bright, bold = true },
    Substitute   = { fg = c.bg, bg = c.red },

    -- Line numbers & gutter
    LineNr       = { fg = c.fg_muted },
    SignColumn   = { fg = c.fg_muted, bg = bg_sign },
    FoldColumn   = { fg = c.fg_muted, bg = bg_sign },
    Folded       = { fg = c.fg_dim, bg = c.bg_alt },

    -- Status line & tab line
    StatusLine   = { fg = c.fg, bg = c.bg_alt },
    StatusLineNC = { fg = c.fg_muted, bg = c.bg_dim },
    TabLine      = { fg = c.fg_dim, bg = c.bg_alt },
    TabLineSel   = { fg = c.fg, bg = c.bg, bold = true },
    TabLineFill  = { bg = c.bg_deep },
    WinBar       = { fg = c.fg_dim, bg = bg },
    WinBarNC     = { fg = c.fg_muted, bg = bg },

    -- Window separators
    WinSeparator = { fg = c.border, bg = c.none },
    VertSplit    = { link = "WinSeparator" },

    -- Popup menu
    Pmenu        = { fg = c.fg, bg = c.bg_alt },
    PmenuSel     = { fg = c.none, bg = c.selection },
    PmenuSbar    = { bg = c.bg_hl },
    PmenuThumb   = { bg = c.fg_muted },

    -- Messages
    MsgArea      = { fg = c.fg },
    ModeMsg      = { fg = c.fg, bold = true },
    MoreMsg      = { fg = c.blue },
    Question     = { fg = c.blue },
    ErrorMsg     = { fg = c.red, bold = true },
    WarningMsg   = { fg = c.orange, bold = true },

    -- Misc UI
    Directory    = { fg = c.blue },
    Title        = { fg = c.blue_dim, bold = true },
    SpecialKey   = { fg = c.fg_muted },
    NonText      = { fg = c.bg_hl },
    Conceal      = { fg = c.fg_subtle },
    EndOfBuffer  = { fg = c.bg },
    Whitespace   = { fg = c.bg_hl },

    -- Matching & spelling
    MatchParen   = { fg = c.orange, bg = c.bg_hl, bold = true },
    SpellBad     = { undercurl = true, sp = c.red },
    SpellCap     = { undercurl = true, sp = c.orange },
    SpellLocal   = { undercurl = true, sp = c.cyan },
    SpellRare    = { undercurl = true, sp = c.magenta },

    -- Diff
    DiffAdd      = { bg = require("nepes.utils").blend(c.green, c.bg, 0.15) },
    DiffChange   = { bg = require("nepes.utils").blend(c.yellow, c.bg, 0.10) },
    DiffDelete   = { bg = require("nepes.utils").blend(c.red, c.bg, 0.15) },
    DiffText     = { bg = require("nepes.utils").blend(c.yellow, c.bg, 0.25) },

    -- WildMenu
    WildMenu     = { link = "PmenuSel" },

    -- QuickFix
    qfLineNr     = { fg = c.fg_muted },
    qfFileName   = { fg = c.blue },

    -- Debug
    debugPC        = { bg = c.bg_alt },
    debugBreakpoint = { fg = c.red, bg = c.bg },
  }
end

return M
