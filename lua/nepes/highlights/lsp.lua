local M = {}

---@param c table Palette colors
---@param config table Plugin configuration
---@return table LSP highlight groups
function M.get(c, config)
  local blend = require("nepes.utils").blend

  return {
    -- Diagnostics
    DiagnosticError            = { fg = c.red },
    DiagnosticWarn             = { fg = c.orange },
    DiagnosticInfo             = { fg = c.blue },
    DiagnosticHint             = { fg = c.cyan },
    DiagnosticOk               = { fg = c.green },

    -- Diagnostic underlines
    DiagnosticUnderlineError   = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = c.orange },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = c.blue },
    DiagnosticUnderlineHint    = { undercurl = true, sp = c.cyan },
    DiagnosticUnderlineOk      = { undercurl = true, sp = c.green },

    -- Diagnostic virtual text (with subtle tinted backgrounds)
    DiagnosticVirtualTextError = { fg = c.red, bg = blend(c.red, c.bg, 0.08) },
    DiagnosticVirtualTextWarn  = { fg = c.orange, bg = blend(c.orange, c.bg, 0.08) },
    DiagnosticVirtualTextInfo  = { fg = c.blue, bg = blend(c.blue, c.bg, 0.08) },
    DiagnosticVirtualTextHint  = { fg = c.cyan, bg = blend(c.cyan, c.bg, 0.08) },
    DiagnosticVirtualTextOk    = { fg = c.green, bg = blend(c.green, c.bg, 0.08) },

    -- Diagnostic signs
    DiagnosticSignError        = { fg = c.red },
    DiagnosticSignWarn         = { fg = c.orange },
    DiagnosticSignInfo         = { fg = c.blue },
    DiagnosticSignHint         = { fg = c.cyan },
    DiagnosticSignOk           = { fg = c.green },

    -- Diagnostic floating windows
    DiagnosticFloatingError    = { fg = c.red },
    DiagnosticFloatingWarn     = { fg = c.orange },
    DiagnosticFloatingInfo     = { fg = c.blue },
    DiagnosticFloatingHint     = { fg = c.cyan },
    DiagnosticFloatingOk       = { fg = c.green },

    -- LSP references
    LspReferenceText           = { bg = c.bg_hl },
    LspReferenceRead           = { bg = c.bg_hl },
    LspReferenceWrite          = { bg = c.bg_hl, bold = true },

    -- LSP inlay hints
    LspInlayHint               = { fg = c.fg_muted, italic = true },

    -- LSP signature
    LspSignatureActiveParameter = { fg = c.orange, bold = true },

    -- LSP codelens
    LspCodeLens                = { fg = c.fg_muted },
    LspCodeLensSeparator       = { fg = c.border },

    -- LSP info window
    LspInfoBorder              = { fg = c.border },
  }
end

return M
