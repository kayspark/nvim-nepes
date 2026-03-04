local M = {}

---@param c table Palette colors
---@param config table Plugin configuration
---@return table Plugin highlight groups
function M.get(c, config)
  local transparent = config.transparent
  local bg_float = transparent and c.none or c.bg_dim

  return {
    -- =====================================================================
    -- Neo-tree
    -- =====================================================================
    NeoTreeNormal              = { fg = c.fg, bg = transparent and c.none or c.bg_deep },
    NeoTreeNormalNC            = { fg = c.fg, bg = transparent and c.none or c.bg_deep },
    NeoTreeRootName            = { fg = c.blue, bold = true },
    NeoTreeFileName            = { fg = c.fg },
    NeoTreeFileNameOpened      = { fg = c.blue },
    NeoTreeDirectoryName       = { fg = c.blue },
    NeoTreeDirectoryIcon       = { fg = c.blue },
    NeoTreeGitAdded            = { fg = c.green },
    NeoTreeGitModified         = { fg = c.orange },
    NeoTreeGitDeleted          = { fg = c.red },
    NeoTreeGitConflict         = { fg = c.red_bright, bold = true },
    NeoTreeGitUntracked        = { fg = c.fg_muted },
    NeoTreeIndentMarker        = { fg = c.bg_hl },
    NeoTreeExpander            = { fg = c.fg_muted },
    NeoTreeSymbolicLinkTarget  = { fg = c.cyan },
    NeoTreeDimText             = { fg = c.fg_muted },
    NeoTreeTitleBar            = { fg = c.fg, bg = c.bg_alt },
    NeoTreeFloatBorder         = { fg = c.border, bg = bg_float },
    NeoTreeFloatTitle          = { fg = c.blue, bg = bg_float, bold = true },
    NeoTreeWinSeparator        = { fg = c.bg_deep, bg = transparent and c.none or c.bg_deep },

    -- =====================================================================
    -- Telescope
    -- =====================================================================
    TelescopeNormal            = { fg = c.fg, bg = bg_float },
    TelescopeBorder            = { fg = c.border, bg = bg_float },
    TelescopePromptNormal      = { fg = c.fg, bg = transparent and c.none or c.bg_alt },
    TelescopePromptBorder      = { fg = c.border, bg = transparent and c.none or c.bg_alt },
    TelescopePromptTitle       = { fg = c.bg, bg = c.blue, bold = true },
    TelescopePromptPrefix      = { fg = c.blue },
    TelescopePromptCounter     = { fg = c.fg_muted },
    TelescopeResultsTitle      = { fg = c.bg, bg = c.magenta, bold = true },
    TelescopePreviewTitle      = { fg = c.bg, bg = c.green, bold = true },
    TelescopeSelection         = { bg = c.selection },
    TelescopeSelectionCaret    = { fg = c.orange },
    TelescopeMatching          = { fg = c.orange, bold = true },
    TelescopeMultiSelection    = { fg = c.cyan },
    TelescopeMultiIcon         = { fg = c.cyan },
    TelescopePreviewLine       = { bg = c.bg_hl },

    -- =====================================================================
    -- Which-key
    -- =====================================================================
    WhichKey                   = { fg = c.cyan },
    WhichKeyGroup              = { fg = c.blue },
    WhichKeyDesc               = { fg = c.fg },
    WhichKeySeparator          = { fg = c.fg_muted },
    WhichKeyFloat              = { bg = bg_float },
    WhichKeyBorder             = { fg = c.border, bg = bg_float },
    WhichKeyValue              = { fg = c.fg_dim },
    WhichKeyNormal             = { bg = bg_float },

    -- =====================================================================
    -- Noice
    -- =====================================================================
    NoiceCmdline               = { fg = c.fg },
    NoiceCmdlineIcon           = { fg = c.blue },
    NoiceCmdlineIconSearch     = { fg = c.orange },
    NoiceCmdlinePopup          = { fg = c.fg, bg = bg_float },
    NoiceCmdlinePopupBorder    = { fg = c.border },
    NoiceCmdlinePopupTitle     = { fg = c.blue },
    NoiceConfirm               = { fg = c.fg, bg = bg_float },
    NoiceConfirmBorder         = { fg = c.border },
    NoiceFormatProgressDone    = { fg = c.bg, bg = c.blue },
    NoiceFormatProgressTodo    = { fg = c.fg_muted, bg = c.bg_alt },
    NoiceLspProgressClient     = { fg = c.blue },
    NoiceLspProgressSpinner    = { fg = c.orange },
    NoiceLspProgressTitle      = { fg = c.fg },
    NoiceMini                  = { fg = c.fg, bg = c.bg_alt },
    NoicePopup                 = { fg = c.fg, bg = bg_float },
    NoicePopupBorder           = { fg = c.border, bg = bg_float },
    NoiceFormatTitle           = { fg = c.blue },
    NoiceFormatEvent           = { fg = c.cyan },
    NoiceVirtualText           = { fg = c.blue },
    NoiceCompletionItemMenu    = { fg = c.fg_dim },
    NoiceCompletionItemWord    = { fg = c.fg },
    NoiceCompletionItemKindDefault = { fg = c.fg_dim },

    -- =====================================================================
    -- Indent-blankline
    -- =====================================================================
    IblIndent                  = { fg = c.bg_hl },
    IblScope                   = { fg = c.blue_dim },
    IblWhitespace              = { fg = c.bg_hl },

    -- =====================================================================
    -- Gitsigns
    -- =====================================================================
    GitSignsAdd                = { fg = c.green },
    GitSignsChange             = { fg = c.orange },
    GitSignsDelete             = { fg = c.red },
    GitSignsCurrentLineBlame   = { fg = c.fg_muted },
    GitSignsAddNr              = { fg = c.green },
    GitSignsChangeNr           = { fg = c.orange },
    GitSignsDeleteNr           = { fg = c.red },
    GitSignsAddLn              = { link = "DiffAdd" },
    GitSignsChangeLn           = { link = "DiffChange" },
    GitSignsDeleteLn           = { link = "DiffDelete" },
    GitSignsAddInline          = { link = "DiffAdd" },
    GitSignsChangeInline       = { link = "DiffChange" },
    GitSignsDeleteInline       = { link = "DiffDelete" },

    -- =====================================================================
    -- Snacks.nvim
    -- =====================================================================
    SnacksNotifierInfo         = { fg = c.blue },
    SnacksNotifierWarn         = { fg = c.orange },
    SnacksNotifierError        = { fg = c.red },
    SnacksNotifierDebug        = { fg = c.fg_muted },
    SnacksNotifierTrace        = { fg = c.magenta },
    SnacksDashboardHeader      = { fg = c.blue },
    SnacksDashboardIcon        = { fg = c.blue },
    SnacksDashboardKey         = { fg = c.orange },
    SnacksDashboardDesc        = { fg = c.fg_dim },
    SnacksDashboardFooter      = { fg = c.fg_muted, italic = true },
    SnacksDashboardTitle       = { fg = c.blue, bold = true },
    SnacksDashboardSpecial     = { fg = c.orange },
    SnacksIndent               = { fg = c.bg_hl },
    SnacksIndentScope          = { fg = c.blue_dim },

    -- =====================================================================
    -- Flash.nvim
    -- =====================================================================
    FlashLabel                 = { fg = c.bg, bg = c.orange, bold = true },
    FlashMatch                 = { fg = c.fg, bg = c.bg_hl },
    FlashCurrent               = { fg = c.fg, bg = c.selection },
    FlashBackdrop              = { fg = c.fg_muted },

    -- =====================================================================
    -- Lazy.nvim
    -- =====================================================================
    LazyButton                 = { fg = c.fg, bg = c.bg_alt },
    LazyButtonActive           = { fg = c.bg, bg = c.blue, bold = true },
    LazyH1                     = { fg = c.bg, bg = c.blue, bold = true },
    LazyH2                     = { fg = c.blue, bold = true },
    LazyNormal                 = { fg = c.fg, bg = bg_float },
    LazyProgressDone           = { fg = c.blue },
    LazyProgressTodo           = { fg = c.bg_hl },
    LazySpecial                = { fg = c.orange },
    LazyComment                = { fg = c.comment },
    LazyDimmed                 = { fg = c.fg_muted },
    LazyProp                   = { fg = c.cyan },
    LazyValue                  = { fg = c.green },
    LazyReasonPlugin           = { fg = c.magenta },
    LazyReasonEvent            = { fg = c.orange },
    LazyReasonCmd              = { fg = c.blue },
    LazyReasonFt               = { fg = c.cyan },
    LazyReasonKeys             = { fg = c.green },
    LazyReasonStart            = { fg = c.red },
    LazyReasonSource           = { fg = c.fg_dim },
    LazyReasonRuntime          = { fg = c.fg_dim },
    LazyReasonImport           = { fg = c.magenta_dim },
    LazyReasonRequire          = { fg = c.magenta_dim },

    -- =====================================================================
    -- Mini
    -- =====================================================================
    MiniIndentscopeSymbol      = { fg = c.blue_dim },
    MiniIndentscopePrefix      = { nocombine = true },

    -- Mini.icons / Mini.files
    MiniFilesNormal            = { fg = c.fg, bg = bg_float },
    MiniFilesBorder            = { fg = c.border, bg = bg_float },
    MiniFilesTitle             = { fg = c.blue, bold = true },
    MiniFilesTitleFocused      = { fg = c.orange, bold = true },
    MiniFilesCursorLine        = { bg = c.bg_dim },

    -- Mini.statusline
    MiniStatuslineDevinfo      = { fg = c.fg_dim, bg = c.bg_alt },
    MiniStatuslineFileinfo     = { fg = c.fg_dim, bg = c.bg_alt },
    MiniStatuslineFilename     = { fg = c.fg, bg = c.bg_dim },
    MiniStatuslineInactive     = { fg = c.fg_muted, bg = c.bg_dim },
    MiniStatuslineModeCommand  = { fg = c.bg, bg = c.orange, bold = true },
    MiniStatuslineModeInsert   = { fg = c.bg, bg = c.green, bold = true },
    MiniStatuslineModeNormal   = { fg = c.bg, bg = c.blue, bold = true },
    MiniStatuslineModeOther    = { fg = c.bg, bg = c.cyan, bold = true },
    MiniStatuslineModeReplace  = { fg = c.bg, bg = c.red, bold = true },
    MiniStatuslineModeVisual   = { fg = c.bg, bg = c.magenta, bold = true },

    -- Mini.notify
    MiniNotifyBorder           = { fg = c.border },
    MiniNotifyNormalError      = { fg = c.red },
    MiniNotifyNormalInfo       = { fg = c.blue },
    MiniNotifyNormalWarn       = { fg = c.orange },

    -- Mini.diff
    MiniDiffSignAdd            = { fg = c.green },
    MiniDiffSignChange         = { fg = c.orange },
    MiniDiffSignDelete         = { fg = c.red },
    MiniDiffOverAdd            = { link = "DiffAdd" },
    MiniDiffOverChange         = { link = "DiffChange" },
    MiniDiffOverContext        = { link = "DiffChange" },
    MiniDiffOverDelete         = { link = "DiffDelete" },

    -- =====================================================================
    -- nvim-cmp / blink.cmp
    -- =====================================================================
    CmpItemAbbr                = { fg = c.fg },
    CmpItemAbbrDeprecated      = { fg = c.fg_muted, strikethrough = true },
    CmpItemAbbrMatch           = { fg = c.orange, bold = true },
    CmpItemAbbrMatchFuzzy      = { fg = c.orange },
    CmpItemMenu                = { fg = c.fg_muted },
    CmpItemKindDefault         = { fg = c.fg_dim },
    CmpItemKindText            = { fg = c.fg },
    CmpItemKindMethod          = { fg = c.cyan },
    CmpItemKindFunction        = { fg = c.cyan },
    CmpItemKindConstructor     = { fg = c.magenta },
    CmpItemKindField           = { fg = c.fg_dim },
    CmpItemKindVariable        = { fg = c.fg },
    CmpItemKindClass           = { fg = c.magenta },
    CmpItemKindInterface       = { fg = c.magenta },
    CmpItemKindModule          = { fg = c.magenta_dim },
    CmpItemKindProperty        = { fg = c.fg_dim },
    CmpItemKindUnit            = { fg = c.orange },
    CmpItemKindValue           = { fg = c.orange },
    CmpItemKindEnum            = { fg = c.magenta },
    CmpItemKindKeyword         = { fg = c.blue },
    CmpItemKindSnippet         = { fg = c.green },
    CmpItemKindColor           = { fg = c.orange },
    CmpItemKindFile            = { fg = c.blue },
    CmpItemKindReference       = { fg = c.cyan },
    CmpItemKindFolder          = { fg = c.blue },
    CmpItemKindEnumMember      = { fg = c.orange },
    CmpItemKindConstant        = { fg = c.orange },
    CmpItemKindStruct          = { fg = c.magenta },
    CmpItemKindEvent           = { fg = c.orange },
    CmpItemKindOperator        = { fg = c.fg_subtle },
    CmpItemKindTypeParameter   = { fg = c.magenta },

    -- blink.cmp specific
    BlinkCmpMenu               = { fg = c.fg, bg = c.bg_alt },
    BlinkCmpMenuBorder         = { fg = c.border, bg = c.bg_alt },
    BlinkCmpMenuSelection      = { bg = c.selection },
    BlinkCmpLabel              = { fg = c.fg },
    BlinkCmpLabelMatch         = { fg = c.orange, bold = true },
    BlinkCmpLabelDeprecated    = { fg = c.fg_muted, strikethrough = true },
    BlinkCmpDoc                = { fg = c.fg, bg = bg_float },
    BlinkCmpDocBorder          = { fg = c.border, bg = bg_float },
    BlinkCmpSignatureHelp      = { fg = c.fg, bg = bg_float },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = bg_float },

    -- =====================================================================
    -- nvim-navic (breadcrumbs)
    -- =====================================================================
    NavicText                  = { fg = c.fg },
    NavicSeparator             = { fg = c.fg_muted },
    NavicIconsFile             = { fg = c.blue },
    NavicIconsModule           = { fg = c.magenta_dim },
    NavicIconsNamespace        = { fg = c.magenta_dim },
    NavicIconsPackage          = { fg = c.magenta_dim },
    NavicIconsClass            = { fg = c.magenta },
    NavicIconsMethod           = { fg = c.cyan },
    NavicIconsProperty         = { fg = c.fg_dim },
    NavicIconsField            = { fg = c.fg_dim },
    NavicIconsConstructor      = { fg = c.magenta },
    NavicIconsEnum             = { fg = c.magenta },
    NavicIconsInterface        = { fg = c.magenta },
    NavicIconsFunction         = { fg = c.cyan },
    NavicIconsVariable         = { fg = c.fg },
    NavicIconsConstant         = { fg = c.orange },
    NavicIconsString           = { fg = c.green },
    NavicIconsNumber           = { fg = c.orange },
    NavicIconsBoolean          = { fg = c.orange },
    NavicIconsArray            = { fg = c.magenta },
    NavicIconsObject           = { fg = c.magenta },
    NavicIconsKey              = { fg = c.blue },
    NavicIconsKeyword          = { fg = c.blue },
    NavicIconsNull             = { fg = c.orange },
    NavicIconsEnumMember       = { fg = c.orange },
    NavicIconsStruct           = { fg = c.magenta },
    NavicIconsEvent            = { fg = c.orange },
    NavicIconsOperator         = { fg = c.fg_subtle },
    NavicIconsTypeParameter    = { fg = c.magenta },

    -- =====================================================================
    -- Trouble.nvim
    -- =====================================================================
    TroubleNormal              = { fg = c.fg, bg = bg_float },
    TroubleNormalNC            = { fg = c.fg, bg = bg_float },
    TroubleText                = { fg = c.fg },
    TroubleCount               = { fg = c.magenta, bold = true },
    TroubleIndent              = { fg = c.bg_hl },

    -- =====================================================================
    -- nvim-notify
    -- =====================================================================
    NotifyERRORBorder          = { fg = c.red },
    NotifyERRORIcon            = { fg = c.red },
    NotifyERRORTitle           = { fg = c.red },
    NotifyWARNBorder           = { fg = c.orange },
    NotifyWARNIcon             = { fg = c.orange },
    NotifyWARNTitle            = { fg = c.orange },
    NotifyINFOBorder           = { fg = c.blue },
    NotifyINFOIcon             = { fg = c.blue },
    NotifyINFOTitle            = { fg = c.blue },
    NotifyDEBUGBorder          = { fg = c.fg_muted },
    NotifyDEBUGIcon            = { fg = c.fg_muted },
    NotifyDEBUGTitle           = { fg = c.fg_muted },
    NotifyTRACEBorder          = { fg = c.magenta },
    NotifyTRACEIcon            = { fg = c.magenta },
    NotifyTRACETitle           = { fg = c.magenta },
    NotifyBackground           = { bg = c.bg },

    -- =====================================================================
    -- Treesitter context
    -- =====================================================================
    TreesitterContext          = { bg = c.bg_dim },
    TreesitterContextLineNumber = { fg = c.fg_muted, bg = c.bg_dim },
    TreesitterContextSeparator = { fg = c.border },

    -- =====================================================================
    -- Dashboard / Alpha
    -- =====================================================================
    DashboardHeader            = { fg = c.blue },
    DashboardCenter            = { fg = c.fg },
    DashboardShortCut          = { fg = c.orange },
    DashboardFooter            = { fg = c.fg_muted, italic = true },

    -- =====================================================================
    -- Bufferline
    -- =====================================================================
    BufferLineIndicatorSelected = { fg = c.blue },
    BufferLineFill              = { bg = c.bg_deep },

    -- =====================================================================
    -- Aerial
    -- =====================================================================
    AerialLine                 = { bg = c.selection },
    AerialGuide                = { fg = c.bg_hl },

    -- =====================================================================
    -- Illuminate
    -- =====================================================================
    IlluminatedWordText        = { bg = c.bg_hl },
    IlluminatedWordRead        = { bg = c.bg_hl },
    IlluminatedWordWrite       = { bg = c.bg_hl, bold = true },

    -- =====================================================================
    -- Leap / Hop
    -- =====================================================================
    LeapMatch                  = { fg = c.orange, bold = true },
    LeapLabelPrimary           = { fg = c.bg, bg = c.orange, bold = true },
    LeapLabelSecondary         = { fg = c.bg, bg = c.cyan, bold = true },
    LeapBackdrop               = { fg = c.fg_muted },

    -- =====================================================================
    -- Marks
    -- =====================================================================
    MarkSignHL                 = { fg = c.blue },
    MarkSignNumHL              = { fg = c.blue },
    MarkVirtTextHL             = { fg = c.fg_muted },

    -- =====================================================================
    -- Headlines (for markdown/org)
    -- =====================================================================
    Headline1                  = { fg = c.blue, bold = true, bg = require("nepes.utils").blend(c.blue, c.bg, 0.08) },
    Headline2                  = { fg = c.magenta, bold = true, bg = require("nepes.utils").blend(c.magenta, c.bg, 0.08) },
    Headline3                  = { fg = c.cyan, bold = true, bg = require("nepes.utils").blend(c.cyan, c.bg, 0.08) },
    Headline4                  = { fg = c.green, bold = true, bg = require("nepes.utils").blend(c.green, c.bg, 0.08) },
    Headline5                  = { fg = c.orange, bold = true, bg = require("nepes.utils").blend(c.orange, c.bg, 0.08) },
    Headline6                  = { fg = c.red, bold = true, bg = require("nepes.utils").blend(c.red, c.bg, 0.08) },
    CodeBlock                  = { bg = c.bg_dim },
    Dash                       = { fg = c.border },
    Quote                      = { fg = c.fg_dim, italic = true },

    -- =====================================================================
    -- Render-markdown
    -- =====================================================================
    RenderMarkdownH1           = { fg = c.blue, bold = true },
    RenderMarkdownH1Bg         = { bg = require("nepes.utils").blend(c.blue, c.bg, 0.08) },
    RenderMarkdownH2           = { fg = c.magenta, bold = true },
    RenderMarkdownH2Bg         = { bg = require("nepes.utils").blend(c.magenta, c.bg, 0.08) },
    RenderMarkdownH3           = { fg = c.cyan, bold = true },
    RenderMarkdownH3Bg         = { bg = require("nepes.utils").blend(c.cyan, c.bg, 0.08) },
    RenderMarkdownH4           = { fg = c.green, bold = true },
    RenderMarkdownH4Bg         = { bg = require("nepes.utils").blend(c.green, c.bg, 0.08) },
    RenderMarkdownH5           = { fg = c.orange, bold = true },
    RenderMarkdownH5Bg         = { bg = require("nepes.utils").blend(c.orange, c.bg, 0.08) },
    RenderMarkdownH6           = { fg = c.red, bold = true },
    RenderMarkdownH6Bg         = { bg = require("nepes.utils").blend(c.red, c.bg, 0.08) },
    RenderMarkdownCode         = { bg = c.bg_dim },
    RenderMarkdownCodeInline   = { fg = c.green },
    RenderMarkdownBullet       = { fg = c.blue },
    RenderMarkdownQuote        = { fg = c.fg_dim, italic = true },
    RenderMarkdownDash         = { fg = c.border },
    RenderMarkdownLink         = { fg = c.blue, underline = true },
    RenderMarkdownTableHead    = { fg = c.blue, bold = true },
    RenderMarkdownTableRow     = { fg = c.fg },
    RenderMarkdownCheckedBox   = { fg = c.green },
    RenderMarkdownUncheckedBox = { fg = c.fg_muted },
  }
end

return M
