local M = {}

-- local _debug = function(content)
--   local f = io.open("/home/acc/.nvim.debug.log", "a")
--
--   f:write(vim.inspect(content) .. "\n")
--   f.close()
-- end

function M.setup(config)
  config = config or require("gruvbox-baby.config")
  local colors = require("gruvbox-baby.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.term = c.term
  theme.base = {

    Boolean = { fg = c.pink },
    Character = { fg = c.clean_green },
    Comment = { fg = c.comment, style = config.comment_style },
    Conceal = { fg = c.comment },
    Conditional = { fg = c.foreground },
    Constant = { fg = c.soft_green },
    CursorIM = { link = "Cursor" },
    CursorLineNr = { fg = c.comment, style = "bold" },
    Debug = { fg = c.orange },
    Define = { fg = c.magenta },
    Delimiter = { fg = c.foreground },
    Directory = { fg = c.dark_gray },
    Error = { fg = c.red, style = "bold" },
    Exception = { fg = c.red },
    Float = { fg = c.pink },
    Function = { fg = c.clean_green },
    Identifier = { fg = c.blue_gray, style = config.variable_style },
    Ignore = { fg = c.dark_gray },
    Include = { fg = c.magenta },
    Keyword = { fg = c.red, style = config.keyword_style },
    Label = { fg = c.orange },
    Macro = { fg = c.soft_green },
    MoreMsg = { fg = c.foreground },
    Normal = { fg = c.foreground, bg = c.background },
    NormalFloat = { fg = c.foreground, bg = c.background_dark },
    Number = { fg = c.pink },
    Operator = { fg = c.orange },
    PreCondit = { fg = c.magenta },
    PreProc = { fg = c.magenta },
    Repeat = { fg = c.soft_green },
    Special = { fg = c.soft_yellow },
    SpecialChar = { fg = c.soft_yellow },
    SpecialComment = { fg = c.comment },
    Statement = { fg = c.red },
    StorageClass = { fg = c.orange },
    String = { fg = c.magenta, style = config.string_style },
    Structure = { fg = c.orange },
    Tag = { fg = c.orange },
    Title = { fg = c.foreground },
    Todo = { fg = c.magenta, style = "italic" },
    ToolbarButton = { fg = c.foreground },
    ToolbarLine = { fg = c.foreground },
    Type = { fg = c.soft_yellow },
    Typedef = { fg = c.red },
    debugPc = { bg = c.error_red },

    TabLine = { bg = c.dark, fg = c.comment },
    TabLineFill = { bg = c.background },
    TabLineSel = { fg = c.foreground, bg = c.background_dark },

    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { bg = c.diff.delete },
    DiffText = { bg = c.diff.text },

    ErrorMsg = { fg = c.red },
    VertSplit = { fg = c.background_light },
    Folded = { fg = c.comment },
    IncSearch = { bg = c.medium_gray },
    LineNr = { fg = c.medium_gray },
    MatchParen = { bg = c.diff.text, style = "underline" },
    NonText = { fg = c.comment },
    Pmenu = { fg = c.foreground, bg = c.background_light },
    PmenuSel = { fg = c.background, bg = c.blue_gray },
    Question = { fg = c.magenta },
    QuickFixLine = { fg = c.magenta },
    Search = { bg = c.medium_gray },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.red, style = "underline" },
    SpellCap = { fg = c.bright_yellow },
    SpellLocal = { fg = c.bright_yellow },
    SpellRare = { fg = c.bright_yellow },
    StatusLine = { fg = c.foreground, bg = c.medium_gray },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.foreground, bg = c.medium_gray },
    StatusLineTermNC = { fg = c.medium_gray },
    Terminal = { fg = c.foreground, bg = c.background },
    VisualNOS = { fg = c.medium_gray },
    WarningMsg = { fg = c.soft_yellow },
    WildMenu = { fg = c.background, bg = c.blue_gray },
    EndOfBuffer = { fg = c.background },

    -- Tree Sitter
    ["@boolean"] = { fg = c.orange },
    ["@define"] = { fg = c.red },
    ["@keyword.directive"] = { fg = c.red },
    ["@comment"] = { fg = c.comment, style = config.comment_style },
    ["@error"] = { fg = c.red },
    ["@punctuation.delimiter"] = { fg = c.foreground },
    ["@punctuation.bracket"] = { fg = c.foreground },
    ["@punctuation.special"] = { fg = c.foreground },
    ["@markup.list"] = { fg = c.foreground },
    ["@constant"] = { fg = c.pink, style = "bold" },
    ["@definition.constant"] = { fg = c.pink, style = "bold" },
    ["@constant.builtin"] = { fg = c.pink },
    ["@string"] = { fg = c.soft_green, style = config.string_style },
    ["@character"] = { fg = c.foreground },
    ["@number"] = { fg = c.magenta },
    ["@namespace"] = { fg = c.light_blue },
    ["@module"] = { fg = c.light_blue },
    ["@func.builtin"] = { fg = c.clean_green },
    ["@function"] = { fg = c.clean_green, style = config.function_style },
    ["@function.call"] = { fg = c.clean_green, style = config.function_style },
    ["@function.builtin"] = { fg = c.clean_green, style = config.function_style },
    ["@func.macro"] = { fg = c.light_blue },
    ["@parameter"] = { fg = c.foreground, style = "nocombine" },
    ["@variable.parameter"] = { fg = c.foreground, style = "nocombine" },
    ["@parameter.reference"] = { fg = c.soft_yellow },
    ["@method"] = { fg = c.clean_green, style = config.function_style },
    ["@function.method"] = { fg = c.clean_green, style = config.function_style },
    ["@method.call"] = { fg = c.clean_green, style = config.function_style },
    ["@function.method.call"] = { fg = c.clean_green, style = config.function_style },
    ["@field"] = { fg = c.light_blue },
    ["@variable.member"] = { fg = c.foreground },
    ["@property"] = { fg = c.foreground },
    ["@constructor"] = { fg = c.clean_green, style = "nocombine" },
    ["@conditional"] = { fg = c.red },
    ["@keyword.conditional"] = { fg = c.red },
    ["@repeat"] = { fg = c.red },
    ["@keyword.repeat"] = { fg = c.red },
    ["@label"] = { fg = c.blue_gray },
    ["@keyword"] = { fg = c.red, style = config.keyword_style },
    ["@keyword.return"] = { fg = c.red, style = config.keyword_style },
    ["@keyword.function"] = { fg = c.red, style = config.keyword_style },
    ["@keyword.operator"] = { fg = c.red },
    ["@operator"] = { fg = c.foreground },
    ["@exception"] = { fg = c.red },
    ["@keyword.exception"] = { fg = c.red },
    ["@type"] = { fg = c.soft_yellow },
    ["@type.builtin"] = { fg = c.soft_yellow },
    ["@type.qualifier"] = { fg = c.orange },
    ["@storageclass.lifetime"] = { fg = c.orange },
    ["@keyword.storage.lifetime"] = { fg = c.orange },
    ["@structure"] = { fg = c.blue_gray },
    ["@variable"] = { fg = c.foreground, style = config.variable_style },
    ["@variable.builtin"] = { fg = c.pink },
    ["@text"] = { fg = c.soft_yellow },
    ["@text.strong"] = { fg = c.soft_yellow, style = "bold" },
    ["@text.emphasis"] = { fg = c.soft_yellow, style = "italic" },
    ["@text.underline"] = { fg = c.soft_yellow, style = "underline" },
    ["@text.strike"] = { fg = c.medium_gray, style = "strikethrough" },
    ["@text.title"] = { fg = c.soft_yellow },
    ["@text.literal"] = { fg = c.soft_yellow },
    ["@markup"] = { fg = c.soft_yellow },
    ["@markup.strong"] = { fg = c.soft_yellow, style = "bold" },
    ["@markup.emphasis"] = { fg = c.soft_yellow, style = "italic" },
    ["@markup.underline"] = { fg = c.soft_yellow, style = "underline" },
    ["@markup.strike"] = { fg = c.medium_gray, style = "strikethrough" },
    ["@markup.heading"] = { fg = c.soft_yellow },
    ["@markup.raw"] = { fg = c.soft_yellow },
    ["@uri"] = { fg = c.soft_yellow },
    ["@tag"] = { fg = c.pink },
    ["@tag.delimiter"] = { fg = c.comment },
    ["@tag.attribute"] = { fg = c.soft_yellow },
    --
    -- per language TreeSitter
    ["@variable.python"] = { fg = c.foreground, style = "NONE" },
    ["@attribute.python"] = { fg = c.orange, style = "bold" },
    ["@decorator"] = { fg = c.orange, style = "bold" },
    ["@variable.rust"] = { fg = c.foreground, style = "NONE" },
    ["@conditional.javascript"] = { fg = c.red },
    ["@keyword.conditional.javascript"] = { fg = c.red },
    ["@variable.javascript"] = { fg = c.pink },

    ["@lsp.type.class"] = { fg = c.soft_yellow },
    ["@lsp.type.decorator"] = { fg = c.orange },
    ["@lsp.type.enum"] = { fg = c.soft_yellow },
    ["@lsp.type.enumMember"] = { fg = c.foreground },
    ["@lsp.type.function"] = { fg = c.clean_green, style = config.function_style },
    ["@lsp.type.interface"] = { fg = c.soft_yellow },
    ["@lsp.type.macro"] = { fg = c.orange },
    ["@lsp.type.method"] = { fg = c.clean_green },
    ["@lsp.type.namespace"] = { fg = c.pink },
    ["@lsp.type.parameter"] = { fg = c.foreground },
    ["@lsp.type.property"] = { fg = c.blue_gray },
    ["@lsp.type.struct"] = { fg = c.soft_yellow },
    ["@lsp.type.type"] = { fg = c.soft_yellow },
    ["@lsp.type.typeParameter"] = { fg = c.soft_yellow },
    ["@lsp.type.variable"] = { fg = c.foreground },

    htmlArg = { fg = c.soft_yellow },
    htmlBold = { fg = c.bright_yellow, style = "bold" },
    htmlEndTag = { fg = c.foreground },
    htmlH1 = { fg = c.foreground },
    htmlH2 = { fg = c.foreground },
    htmlH3 = { fg = c.foreground },
    htmlH4 = { fg = c.foreground },
    htmlH5 = { fg = c.foreground },
    htmlH6 = { fg = c.foreground },
    htmlItalic = { fg = c.magenta, style = "italic" },
    htmlLink = { fg = c.foreground, style = "underline" },
    htmlSpecialChar = { fg = c.soft_yellow },
    htmlSpecialTagName = { fg = c.blue_gray },
    htmlTag = { fg = c.dark_gray },
    htmlTagN = { fg = c.orange },
    htmlTagName = { fg = c.orange },
    htmlTitle = { fg = c.foreground },

    markdownBlockquote = { fg = c.comment },
    markdownBold = { fg = c.bright_yellow, style = "bold" },
    markdownCode = { fg = c.soft_yellow },
    markdownCodeBlock = { fg = c.comment },
    markdownCodeDelimiter = { fg = c.comment },
    markdownH1 = { fg = c.foreground },
    markdownH2 = { fg = c.foreground },
    markdownH3 = { fg = c.foreground },
    markdownH4 = { fg = c.foreground },
    markdownH5 = { fg = c.foreground },
    markdownH6 = { fg = c.foreground },
    markdownHeadingDelimiter = { fg = c.orange },
    markdownHeadingRule = { fg = c.comment },
    markdownId = { fg = c.magenta },
    markdownIdDeclaration = { fg = c.blue_gray },
    markdownIdDelimiter = { fg = c.magenta },
    markdownItalic = { fg = c.magenta, style = "italic" },
    markdownLinkDelimiter = { fg = c.magenta },
    markdownLinkText = { fg = c.blue_gray },
    markdownListMarker = { fg = c.orange },
    markdownOrderedListMarker = { fg = c.orange },
    markdownRule = { fg = c.comment },
    markdownUrl = { fg = c.soft_green, style = "underline" },

    phpInclude = { fg = c.magenta },
    phpClass = { fg = c.soft_yellow },
    phpClasses = { fg = c.soft_yellow },
    phpFunction = { fg = c.blue_gray },
    phpType = { fg = c.magenta },
    phpKeyword = { fg = c.magenta },
    phpVarSelector = { fg = c.foreground },
    phpIdentifier = { fg = c.foreground },
    phpMethod = { fg = c.blue_gray },
    phpBoolean = { fg = c.blue_gray },
    phpParent = { fg = c.foreground },
    phpOperator = { fg = c.magenta },
    phpRegion = { fg = c.magenta },
    phpUseNamespaceSeparator = { fg = c.foreground },
    phpClassNamespaceSeparator = { fg = c.foreground },
    phpDocTags = { fg = c.magenta },
    phpDocParam = { fg = c.magenta },

    CocExplorerIndentLine = { fg = c.comment },
    CocExplorerBufferRoot = { fg = c.orange },
    CocExplorerFileRoot = { fg = c.orange },
    CocExplorerBufferFullPath = { fg = c.comment },
    CocExplorerFileFullPath = { fg = c.comment },
    CocExplorerBufferReadonly = { fg = c.magenta },
    CocExplorerBufferModified = { fg = c.magenta },
    CocExplorerBufferNameVisible = { fg = c.orange },
    CocExplorerFileReadonly = { fg = c.magenta },
    CocExplorerFileModified = { fg = c.magenta },
    CocExplorerFileHidden = { fg = c.comment },
    CocExplorerHelpLine = { fg = c.magenta },
    CocHighlightText = { bg = c.dark },

    EasyMotionTarget = { fg = c.red, style = "bold" },
    EasyMotionTarget2First = { fg = c.red, style = "bold" },
    EasyMotionTarget2Second = { fg = c.red, style = "bold" },

    StartifyNumber = { fg = c.foreground },
    StartifySelect = { fg = c.blue_gray },
    StartifyBracket = { fg = c.foreground },
    StartifySpecial = { fg = c.orange },
    StartifyVar = { fg = c.blue_gray },
    StartifyPath = { fg = c.soft_yellow },
    StartifyFile = { fg = c.foreground },
    StartifySlash = { fg = c.foreground },
    StartifyHeader = { fg = c.medium_gray },
    StartifySection = { fg = c.soft_yellow },
    StartifyFooter = { fg = c.soft_yellow },

    WhichKey = { fg = c.magenta },
    WhichKeySeperator = { fg = c.soft_yellow },
    WhichKeyGroup = { fg = c.orange },
    WhichKeyDesc = { fg = c.forest_green },

    diffAdded = { fg = c.diff.add },
    diffRemoved = { fg = c.diff.delete },
    diffFileId = { fg = c.magenta },
    diffFile = { fg = c.comment },
    diffNewFile = { fg = c.soft_yellow },
    diffOldFile = { fg = c.orange },

    SignifySignAdd = { fg = c.soft_yellow },
    SignifySignChange = { fg = c.soft_yellow },
    SignifySignDelete = { fg = c.orange },
    GitGutterAdd = { fg = c.forest_green },
    GitGutterChange = { fg = c.soft_yellow },
    GitGutterDelete = { fg = c.error_red },
    debugBreakpoint = { fg = c.error_red, style = "reverse" },

    VimwikiHeader1 = { fg = c.orange, style = "bold" },
    VimwikiHeader2 = { fg = c.soft_green, style = "bold" },
    VimwikiHeader3 = { fg = c.dark_gray, style = "bold" },
    VimwikiHeader4 = { fg = c.clean_green, style = "bold" },
    VimwikiHeader5 = { fg = c.red, style = "bold" },
    VimwikiHeader6 = { fg = c.pink, style = "bold" },
    VimwikiLink = { fg = c.forest_green },
    VimwikiHeaderChar = { fg = c.medium_gray },
    VimwikiHR = { fg = c.soft_yellow },
    VimwikiList = { fg = c.orange },
    VimwikiTag = { fg = c.orange },
    VimwikiMarkers = { fg = c.medium_gray },

    ColorColumn = { bg = c.background_dark },
    SignColumn = { bg = c.background },
    CursorColumn = { bg = c.background_light },
    CursorLine = { bg = c.background_light },
    FoldColumn = { fg = c.none },
    PmenuSbar = { bg = c.comment },
    PmenuThumb = { bg = c.foreground },
    EasyMotionShade = { fg = c.NONE },
    Visual = { bg = c.medium_gray },
    MultiCursor = { bg = c.background_light },
    Cursor = { bg = c.background_light, fg = c.NONE },

    -- mix
    GitSignsCurrentLineBlame = { fg = c.medium_gray },
    Underlined = { fg = c.error_red, style = "underline" },
    ["@variable.cpp"] = { fg = c.foreground },

    -- Nvim Tree
    NvimTreeNormal = { fg = c.foreground, bg = c.background_dark },
    NvimTreeNormalNC = { fg = c.foreground, bg = c.background_dark },
    NvimTreeFolderIcon = { fg = c.soft_yellow },
    NvimTreeRootFolder = { fg = c.magenta },
    NvimTreeExecFile = { fg = c.light_blue, style = "NONE" },

    NvimTreeGitDirty = { fg = c.red },
    NvimTreeGitStaged = { fg = c.foreground },
    NvimTreeGitMerge = { fg = c.soft_yellow },
    NvimTreeGitRenamed = { fg = c.soft_yellow },
    NvimTreeGitNew = { fg = c.soft_green },
    NvimTreeGitDeleted = { fg = c.red },

    -- NeoTree
    NeoTreeNormal = { fg = c.foreground, bg = c.background_dark },
    NeoTreeNormalNC = { fg = c.foreground, bg = c.background_dark },
    NeoTreeVertSplit = { fg = c.background, bg = c.background },
    NeoTreeWinSeparator = { fg = c.background, bg = c.background },
    NeoTreeDirectoryIcon = { fg = c.soft_yellow },
    NeoTreeRootName = { fg = c.magenta },
    NeoTreeExecFile = { fg = c.light_blue, style = "NONE" },

    NeoTreeGitUnstaged = { fg = c.red },
    NeoTreeGitStaged = { fg = c.foreground },
    NeoTreeGitModified = { fg = c.soft_yellow },
    NeoTreeGitUnstracked = { fg = c.soft_green },
    NeoTreeGitDeleted = { fg = c.red },

    -- Hop
    HopNextKey = { fg = c.soft_yellow, bg = c.dark, style = "bold" },
    HopNextKey1 = { fg = c.soft_yellow, bg = c.dark, style = "bold" },
    HopNextKey2 = { fg = c.milk, bg = c.dark },

    -- indent blankline
    IndentBlanklineChar = { fg = "#414141" },
    IndentBlanklineSpaceChar = { fg = "#414141" },
    IndentBlanklineSpaceCharBlankline = { fg = "#414141" },
    IndentBlanklineContextChar = { fg = "#505050" },

    FloatBorder = { bg = c.background_dark },
    -- Cmp
    CmpDocumentation = { fg = c.foreground, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.medium_gray, bg = c.bg_float },

    CmpItemAbbr = { fg = c.foreground },
    CmpItemAbbrDeprecated = { fg = c.milk, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.light_blue },
    CmpItemAbbrMatchFuzzy = { fg = c.light_blue },

    CmpItemKindDefault = { fg = c.dark_gray },
    CmpItemMenu = { fg = c.comment },

    CmpItemKindKeyword = { fg = c.blue_gray },

    CmpItemKindVariable = { fg = c.magenta },
    CmpItemKindConstant = { fg = c.magenta },
    CmpItemKindReference = { fg = c.magenta },
    CmpItemKindValue = { fg = c.magenta },

    CmpItemKindFunction = { fg = c.orange },
    CmpItemKindMethod = { fg = c.orange },
    CmpItemKindConstructor = { fg = c.orange },

    CmpItemKindClass = { fg = c.pink },
    CmpItemKindInterface = { fg = c.pink },
    CmpItemKindStruct = { fg = c.pink },
    CmpItemKindEvent = { fg = c.pink },
    CmpItemKindEnum = { fg = c.pink },
    CmpItemKindUnit = { fg = c.pink },

    CmpItemKindModule = { fg = c.soft_yellow },

    CmpItemKindProperty = { fg = c.pink },
    CmpItemKindField = { fg = c.pink },
    CmpItemKindTypeParameter = { fg = c.pink },
    CmpItemKindEnumMember = { fg = c.pink },
    CmpItemKindOperator = { fg = c.pink },
    CmpItemKindSnippet = { fg = c.gray },

    -- Mutt-Mail:
    mailHeader = { fg = c.red },
    mailHeaderKey = { fg = c.red },
    mailHeaderEmail = { fg = c.magenta },
    mailSubject = { fg = c.foreground, style = "italic" },

    mailQuoted1 = { fg = c.clean_green },
    mailQuoted2 = { fg = c.light_blue },
    mailQuoted3 = { fg = c.blue_gray },
    mailQuoted4 = { fg = c.pink },
    mailQuoted5 = { fg = c.soft_green },
    mailQuoted6 = { fg = c.orange },

    mailQuotedExp1 = { fg = c.milk },
    mailQuotedExp2 = { fg = c.light_blue },
    mailQuotedExp3 = { fg = c.blue_gray },
    mailQuotedExp4 = { fg = c.pink },
    mailQuotedExp5 = { fg = c.soft_green },
    mailQuotedExp6 = { fg = c.orange },

    mailSignature = { fg = c.comment },
    mailURL = { fg = c.orange, style = "underline" },
    mailEmail = { fg = c.soft_yellow },

    rainbowcol1 = { fg = c.magenta },
    rainbowcol2 = { fg = c.dark_gray },
    rainbowcol3 = { fg = c.clean_green },
    rainbowcol4 = { fg = c.soft_green },
    rainbowcol5 = { fg = c.soft_yellow },
    rainbowcol6 = { fg = c.orange },
    rainbowcol7 = { fg = c.pink },

    -- Illuminate:
    IlluminatedWordText = { bg = c.background_light },
    IlluminatedWordRead = { bg = c.background_light },
    IlluminatedWordWrite = { bg = c.background_light },

    -- Dashboard
    DashboardHeader = { fg = c.red },
    DashboardShortCut = { fg = c.light_blue },
    DashboardCenter = { fg = c.bright_yellow },
    DashboardFooter = { fg = c.blue_gray },

    -- kkharji/lspsaga.nvim
    DiagnosticError = { fg = c.red },
    DiagnosticWarning = { fg = c.soft_yellow },
    DiagnosticInformation = { fg = c.light_blue },
    DiagnosticHint = { fg = c.dark_gray },
    LspSagaDiagnosticBorder = { fg = c.milk },
    LspSagaDiagnosticHeader = { fg = c.bright_yellow },
    LspSagaDiagnosticTruncateLine = { fg = c.milk },
    LspSagaRenameBoarder = { fg = c.blue_gray },
  }

  if config.telescope_theme then
    theme.base = vim.tbl_extend("force", theme.base, {
      -- Telescope
      TelescopeBorder = { fg = c.background_dark, bg = c.background_dark },
      TelescopePromptCounter = { fg = c.milk, bg = c.medium_gray },
      TelescopePromptBorder = { fg = c.medium_gray, bg = c.medium_gray },
      TelescopePromptNormal = { fg = c.milk, bg = c.medium_gray },
      TelescopePromptPrefix = { fg = c.soft_yellow, bg = c.medium_gray },

      TelescopeNormal = { bg = c.background_dark },

      TelescopePreviewTitle = { fg = c.background, bg = c.forest_green },
      TelescopePromptTitle = { fg = c.background, bg = c.soft_yellow },
      TelescopeResultsTitle = { fg = c.background_dark, bg = c.milk },

      TelescopeSelection = { bg = c.diff.change },
    })
  end

  if config.transparent_mode then
    theme.base = vim.tbl_extend("force", theme.base, {
      Visual = { bg = c.background_light },
      MultiCursor = { bg = c.background_light },
      Cursor = { bg = c.background_light, c.dark },
    })
  end

  theme.base = vim.tbl_extend("force", theme.base, config.highlights or {})
  theme.term = vim.tbl_extend("force", theme.term, config.term_highlights or {})
  return theme
end

return M
