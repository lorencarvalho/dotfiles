-- Tomorrow Night colorscheme for Neovim
-- Converted from: https://github.com/chriskempson/tomorrow-theme

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.g.colors_name = 'tomorrow-night'

-- Color palette
local colors = {
  foreground = '#c5c8c6',
  background = '#1d1f21',
  selection  = '#373b41',
  line       = '#282a2e',
  comment    = '#969896',
  red        = '#cc6666',
  orange     = '#de935f',
  yellow     = '#f0c674',
  green      = '#b5bd68',
  aqua       = '#8abeb7',
  blue       = '#81a2be',
  purple     = '#b294bb',
  window     = '#4d5057',
}

-- Helper function to set highlights
local function hi(group, opts)
  local cmd = 'highlight ' .. group
  if opts.fg then cmd = cmd .. ' guifg=' .. opts.fg end
  if opts.bg then cmd = cmd .. ' guibg=' .. opts.bg end
  if opts.gui then cmd = cmd .. ' gui=' .. opts.gui end
  if opts.sp then cmd = cmd .. ' guisp=' .. opts.sp end
  vim.cmd(cmd)
end

-- Editor colors
hi('Normal', { fg = colors.foreground, bg = colors.background })
hi('Bold', { gui = 'bold' })
hi('Debug', { fg = colors.red })
hi('Directory', { fg = colors.blue })
hi('Error', { fg = colors.foreground, bg = colors.red })
hi('ErrorMsg', { fg = colors.red, bg = colors.background })
hi('Exception', { fg = colors.red })
hi('FoldColumn', { fg = colors.blue, bg = colors.background })
hi('Folded', { fg = colors.comment, bg = colors.background })
hi('IncSearch', { fg = colors.line, bg = colors.orange })
hi('Italic', { gui = 'italic' })
hi('Macro', { fg = colors.red })
hi('MatchParen', { bg = colors.selection })
hi('ModeMsg', { fg = colors.green })
hi('MoreMsg', { fg = colors.green })
hi('Question', { fg = colors.blue })
hi('Search', { fg = colors.line, bg = colors.yellow })
hi('Substitute', { fg = colors.line, bg = colors.yellow })
hi('SpecialKey', { fg = colors.selection })
hi('TooLong', { fg = colors.red })
hi('Underlined', { fg = colors.red })
hi('Visual', { bg = colors.selection })
hi('VisualNOS', { fg = colors.red })
hi('WarningMsg', { fg = colors.red })
hi('WildMenu', { fg = colors.red, bg = colors.yellow })
hi('Title', { fg = colors.blue })
hi('Conceal', { fg = colors.blue, bg = colors.background })
hi('Cursor', { fg = colors.background, bg = colors.foreground })
hi('NonText', { fg = colors.selection })
hi('LineNr', { fg = colors.selection, bg = colors.background })
hi('SignColumn', { fg = colors.selection, bg = colors.background })
hi('StatusLine', { fg = colors.window, bg = colors.line })
hi('StatusLineNC', { fg = colors.comment, bg = colors.line })
hi('VertSplit', { fg = colors.window, bg = colors.window })
hi('ColorColumn', { bg = colors.line })
hi('CursorColumn', { bg = colors.line })
hi('CursorLine', { bg = colors.line })
hi('CursorLineNr', { fg = colors.yellow, bg = colors.line })
hi('QuickFixLine', { bg = colors.line })
hi('PMenu', { fg = colors.foreground, bg = colors.line })
hi('PMenuSel', { fg = colors.foreground, bg = colors.selection })
hi('TabLine', { fg = colors.comment, bg = colors.line })
hi('TabLineFill', { fg = colors.comment, bg = colors.line })
hi('TabLineSel', { fg = colors.yellow, bg = colors.line })

-- Standard syntax
hi('Boolean', { fg = colors.orange })
hi('Character', { fg = colors.red })
hi('Comment', { fg = colors.comment })
hi('Conditional', { fg = colors.purple })
hi('Constant', { fg = colors.orange })
hi('Define', { fg = colors.purple })
hi('Delimiter', { fg = colors.aqua })
hi('Float', { fg = colors.orange })
hi('Function', { fg = colors.blue })
hi('Identifier', { fg = colors.red })
hi('Include', { fg = colors.blue })
hi('Keyword', { fg = colors.purple })
hi('Label', { fg = colors.yellow })
hi('Number', { fg = colors.orange })
hi('Operator', { fg = colors.aqua })
hi('PreProc', { fg = colors.yellow })
hi('Repeat', { fg = colors.yellow })
hi('Special', { fg = colors.aqua })
hi('SpecialChar', { fg = colors.aqua })
hi('Statement', { fg = colors.red })
hi('StorageClass', { fg = colors.yellow })
hi('String', { fg = colors.green })
hi('Structure', { fg = colors.purple })
hi('Tag', { fg = colors.yellow })
hi('Todo', { fg = colors.yellow, bg = colors.background })
hi('Type', { fg = colors.yellow })
hi('Typedef', { fg = colors.yellow })

-- Diff highlighting
hi('DiffAdd', { fg = colors.green, bg = colors.background })
hi('DiffChange', { fg = colors.yellow, bg = colors.background })
hi('DiffDelete', { fg = colors.red, bg = colors.background })
hi('DiffText', { fg = colors.blue, bg = colors.background })
hi('DiffAdded', { fg = colors.green, bg = colors.background })
hi('DiffFile', { fg = colors.red, bg = colors.background })
hi('DiffNewFile', { fg = colors.green, bg = colors.background })
hi('DiffLine', { fg = colors.blue, bg = colors.background })
hi('DiffRemoved', { fg = colors.red, bg = colors.background })

-- Git highlighting
hi('gitcommitOverflow', { fg = colors.red })
hi('gitcommitSummary', { fg = colors.green })
hi('gitcommitComment', { fg = colors.comment })
hi('gitcommitUntracked', { fg = colors.comment })
hi('gitcommitDiscarded', { fg = colors.comment })
hi('gitcommitSelected', { fg = colors.comment })
hi('gitcommitHeader', { fg = colors.purple })
hi('gitcommitSelectedType', { fg = colors.blue })
hi('gitcommitUnmergedType', { fg = colors.blue })
hi('gitcommitDiscardedType', { fg = colors.blue })
hi('gitcommitBranch', { fg = colors.orange, gui = 'bold' })
hi('gitcommitUntrackedFile', { fg = colors.yellow })
hi('gitcommitUnmergedFile', { fg = colors.red, gui = 'bold' })
hi('gitcommitDiscardedFile', { fg = colors.red, gui = 'bold' })
hi('gitcommitSelectedFile', { fg = colors.green, gui = 'bold' })

-- GitGutter highlighting
hi('GitGutterAdd', { fg = colors.green, bg = colors.background })
hi('GitGutterChange', { fg = colors.blue, bg = colors.background })
hi('GitGutterDelete', { fg = colors.red, bg = colors.background })
hi('GitGutterChangeDelete', { fg = colors.purple, bg = colors.background })

-- HTML highlighting
hi('htmlBold', { fg = colors.yellow })
hi('htmlItalic', { fg = colors.purple })
hi('htmlEndTag', { fg = colors.foreground })
hi('htmlTag', { fg = colors.foreground })

-- JavaScript highlighting
hi('javaScript', { fg = colors.foreground })
hi('javaScriptBraces', { fg = colors.foreground })
hi('javaScriptNumber', { fg = colors.orange })

-- pangloss/vim-javascript highlighting
hi('jsOperator', { fg = colors.blue })
hi('jsStatement', { fg = colors.purple })
hi('jsReturn', { fg = colors.purple })
hi('jsThis', { fg = colors.red })
hi('jsClassDefinition', { fg = colors.yellow })
hi('jsFunction', { fg = colors.purple })
hi('jsFuncName', { fg = colors.blue })
hi('jsFuncCall', { fg = colors.blue })
hi('jsClassFuncName', { fg = colors.blue })
hi('jsClassMethodType', { fg = colors.purple })
hi('jsRegexpString', { fg = colors.aqua })
hi('jsGlobalObjects', { fg = colors.yellow })
hi('jsGlobalNodeObjects', { fg = colors.yellow })
hi('jsExceptions', { fg = colors.yellow })
hi('jsBuiltins', { fg = colors.yellow })

-- Mail highlighting
hi('mailQuoted1', { fg = colors.yellow })
hi('mailQuoted2', { fg = colors.green })
hi('mailQuoted3', { fg = colors.purple })
hi('mailQuoted4', { fg = colors.aqua })
hi('mailQuoted5', { fg = colors.blue })
hi('mailQuoted6', { fg = colors.yellow })
hi('mailURL', { fg = colors.blue })
hi('mailEmail', { fg = colors.blue })

-- Markdown highlighting
hi('markdownCode', { fg = colors.green })
hi('markdownError', { fg = colors.foreground, bg = colors.background })
hi('markdownCodeBlock', { fg = colors.green })
hi('markdownHeadingDelimiter', { fg = colors.blue })

-- NERDTree highlighting
hi('NERDTreeDirSlash', { fg = colors.blue })
hi('NERDTreeExecFile', { fg = colors.foreground })

-- PHP highlighting
hi('phpMemberSelector', { fg = colors.foreground })
hi('phpComparison', { fg = colors.foreground })
hi('phpParent', { fg = colors.foreground })
hi('phpMethodsVar', { fg = colors.aqua })

-- Python highlighting
hi('pythonOperator', { fg = colors.purple })
hi('pythonRepeat', { fg = colors.purple })
hi('pythonInclude', { fg = colors.purple })
hi('pythonStatement', { fg = colors.purple })

-- Ruby highlighting
hi('rubyAttribute', { fg = colors.blue })
hi('rubyConstant', { fg = colors.yellow })
hi('rubyInterpolationDelimiter', { fg = colors.aqua })
hi('rubyRegexp', { fg = colors.aqua })
hi('rubySymbol', { fg = colors.green })
hi('rubyStringDelimiter', { fg = colors.green })

-- SASS highlighting
hi('sassidChar', { fg = colors.red })
hi('sassClassChar', { fg = colors.orange })
hi('sassInclude', { fg = colors.purple })
hi('sassMixing', { fg = colors.purple })
hi('sassMixinName', { fg = colors.blue })

-- Signify highlighting
hi('SignifySignAdd', { fg = colors.green, bg = colors.background })
hi('SignifySignChange', { fg = colors.blue, bg = colors.background })
hi('SignifySignDelete', { fg = colors.red, bg = colors.background })

-- Spelling highlighting
hi('SpellBad', { gui = 'undercurl', sp = colors.red })
hi('SpellLocal', { gui = 'undercurl', sp = colors.aqua })
hi('SpellCap', { gui = 'undercurl', sp = colors.blue })
hi('SpellRare', { gui = 'undercurl', sp = colors.purple })

-- Startify highlighting
hi('StartifyBracket', { fg = colors.foreground })
hi('StartifyFile', { fg = colors.blue })
hi('StartifyFooter', { fg = colors.foreground })
hi('StartifyHeader', { fg = colors.green })
hi('StartifyNumber', { fg = colors.orange })
hi('StartifyPath', { fg = colors.foreground })
hi('StartifySection', { fg = colors.purple })
hi('StartifySelect', { fg = colors.aqua })
hi('StartifySlash', { fg = colors.foreground })
hi('StartifySpecial', { fg = colors.aqua })

-- LSP highlighting
hi('DiagnosticError', { fg = colors.red })
hi('DiagnosticWarn', { fg = colors.yellow })
hi('DiagnosticInfo', { fg = colors.blue })
hi('DiagnosticHint', { fg = colors.aqua })
hi('DiagnosticUnderlineError', { gui = 'undercurl', sp = colors.red })
hi('DiagnosticUnderlineWarn', { gui = 'undercurl', sp = colors.yellow })
hi('DiagnosticUnderlineInfo', { gui = 'undercurl', sp = colors.blue })
hi('DiagnosticUnderlineHint', { gui = 'undercurl', sp = colors.aqua })

-- Treesitter highlighting
hi('@variable', { fg = colors.red })
hi('@variable.builtin', { fg = colors.yellow })
hi('@variable.parameter', { fg = colors.red })
hi('@variable.member', { fg = colors.red })
hi('@constant', { fg = colors.orange })
hi('@constant.builtin', { fg = colors.orange })
hi('@constant.macro', { fg = colors.red })
hi('@string', { fg = colors.green })
hi('@string.escape', { fg = colors.aqua })
hi('@string.special', { fg = colors.aqua })
hi('@character', { fg = colors.red })
hi('@number', { fg = colors.orange })
hi('@boolean', { fg = colors.orange })
hi('@float', { fg = colors.orange })
hi('@function', { fg = colors.blue })
hi('@function.builtin', { fg = colors.blue })
hi('@function.macro', { fg = colors.red })
hi('@function.method', { fg = colors.blue })
hi('@constructor', { fg = colors.yellow })
hi('@keyword', { fg = colors.purple })
hi('@keyword.function', { fg = colors.purple })
hi('@keyword.operator', { fg = colors.purple })
hi('@keyword.return', { fg = colors.purple })
hi('@conditional', { fg = colors.purple })
hi('@repeat', { fg = colors.yellow })
hi('@label', { fg = colors.yellow })
hi('@operator', { fg = colors.aqua })
hi('@exception', { fg = colors.red })
hi('@type', { fg = colors.yellow })
hi('@type.builtin', { fg = colors.yellow })
hi('@structure', { fg = colors.purple })
hi('@include', { fg = colors.blue })
hi('@attribute', { fg = colors.yellow })
hi('@property', { fg = colors.red })
hi('@text.literal', { fg = colors.green })
hi('@text.uri', { fg = colors.blue, gui = 'underline' })
hi('@text.title', { fg = colors.blue, gui = 'bold' })
hi('@text.emphasis', { gui = 'italic' })
hi('@text.strong', { gui = 'bold' })
hi('@tag', { fg = colors.yellow })
hi('@tag.attribute', { fg = colors.red })
hi('@tag.delimiter', { fg = colors.foreground })
hi('@punctuation.delimiter', { fg = colors.aqua })
hi('@punctuation.bracket', { fg = colors.foreground })
hi('@punctuation.special', { fg = colors.aqua })
hi('@comment', { fg = colors.comment })

-- Telescope highlighting
hi('TelescopeBorder', { fg = colors.selection })
hi('TelescopePromptBorder', { fg = colors.selection })
hi('TelescopeResultsBorder', { fg = colors.selection })
hi('TelescopePreviewBorder', { fg = colors.selection })
hi('TelescopeSelection', { bg = colors.selection })
hi('TelescopeMultiSelection', { bg = colors.selection })

-- nvim-cmp highlighting
hi('CmpItemAbbrDeprecated', { fg = colors.comment, gui = 'strikethrough' })
hi('CmpItemAbbrMatch', { fg = colors.blue })
hi('CmpItemAbbrMatchFuzzy', { fg = colors.blue })
hi('CmpItemKindVariable', { fg = colors.red })
hi('CmpItemKindInterface', { fg = colors.yellow })
hi('CmpItemKindText', { fg = colors.foreground })
hi('CmpItemKindFunction', { fg = colors.blue })
hi('CmpItemKindMethod', { fg = colors.blue })
hi('CmpItemKindKeyword', { fg = colors.purple })
hi('CmpItemKindProperty', { fg = colors.red })
hi('CmpItemKindUnit', { fg = colors.orange })
