local colors = {
	-- bg = "#000000",
	bg = "#050505",
	white = "#fafafa",
	fg = "#dddddd",
	light_gray = "#a6a4a4",
	gray = "#908d8d",
	dark_gray = "#444455",
	dark_blue = "#111144",
	light_blue = "#00a2ff",
	green = "#55c551",
	yellow = "#dddd44",
	pure_yellow = "#ffff00",
	light_yellow = "#ffeea0",
	red = "#ff6666",
	pink = "#ff9999",

	-- Gitsigns specific colors
	gitsigns_add = "#00aa00",
	gitsigns_change = "#FFFF00",
	gitsigns_delete = "#FF0000",
	gitsigns_add_dark = "#7a9a54",
	gitsigns_change_dark = "#8b7e4f",
	gitsigns_delete_dark = "#8b4a47",
}

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true

-- Native Neovim highlight helper
local hi = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Core UI & Syntax
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("Constant", { fg = colors.pink })
hi("Comment", { fg = colors.dark_gray, italic = true })
hi("String", { fg = colors.green })
hi("Variable", { fg = colors.fg })
hi("Function", { fg = colors.fg })
hi("Keyword", { fg = colors.light_blue })
hi("Type", { fg = colors.fg })
hi("@type.builtin", { fg = colors.fg })
hi("Identifier", { fg = colors.fg })
hi("Special", { fg = colors.fg, bold = true })
hi("Delimiter", { fg = colors.fg })
hi("Operator", { fg = colors.fg })
hi("CursorLineNr", { fg = colors.yellow, bold = true })
hi("CursorLine", { bg = colors.bg })
hi("ColorColumn", { bg = colors.bg })
hi("Cursor", { fg = colors.dark_gray, bg = colors.dark_gray })
hi("Error", { fg = colors.red })
hi("Warning", { fg = colors.yellow })
hi("VertSplit", { fg = colors.dark_gray })

-- Treesitter General
hi("@attribute", { fg = colors.light_gray })
hi("@keyword.directive", { fg = colors.light_gray })
hi("@keyword.import", { fg = colors.light_gray })
hi("@constructor", { fg = colors.yellow })
hi("@lsp.typemod.class.declaration", { fg = colors.yellow })
hi("@lsp.typemod.class.definition", { fg = colors.yellow })
-- hi("@lsp.typemod.variable.declaration", { fg = colors.light_yellow })
-- hi("@lsp.typemod.parameter.declaration", { fg = colors.light_yellow })
hi("@lsp.typemod.method.declaration", { fg = colors.yellow })
hi("@lsp.typemod.method.definition", { fg = colors.yellow })
hi("@lsp.typemod.function.declaration", { fg = colors.yellow })
hi("@lsp.typemod.function.definition", { fg = colors.yellow })

-- CMake Specific Highlights
-- Sets built-in commands (target_include_directories, add_subdirectory, etc.)
hi("@function.builtin.cmake", { fg = colors.light_yellow })
-- Sets generic / custom functions
hi("@function.cmake", { fg = colors.light_yellow })
-- Sets CMake variable expansion: ${VAR}
hi("@constant.cmake", { fg = colors.yellow, bold = true })
hi("@variable.cmake", { fg = colors.white, bold = false })

-- Markdown
hi("RenderMarkdownCode", { bg = colors.dark_blue, link = "Normal" })
hi("@markup.raw.block.markdown", { bg = colors.dark_blue, link = "Normal" })
hi("@markup.raw.markdown_inline", { bg = colors.dark_blue, link = "Normal" })

-- TSX / HTML
hi("@tag.attribute.tsx", { fg = colors.light_gray })
hi("@tag.builtin.tsx", { fg = colors.light_gray })
hi("@tag.component.tsx", { fg = colors.light_gray })
hi("@tag.html", { fg = colors.yellow })
hi("@tag.attribute.html", { fg = colors.light_gray })
hi("@include.identifier.tsx", { fg = colors.fg })

-- Parentheses matching
hi("BlinkPairsMatchParen", { bg = "#3e4452", fg = "NONE", bold = false })
hi("MatchParen", { bg = "#ff9e64", fg = "#000000", bold = false })
hi("BlinkPairsUnmatched", { bg = "#e06c75", fg = "#ffffff", bold = true })

-- ============================================================================
-- GITSIGNS HIGHLIGHTS
-- ============================================================================
hi("GitSignsAdd", { fg = colors.gitsigns_add })
hi("GitSignsChange", { fg = colors.gitsigns_change })
hi("GitSignsDelete", { fg = colors.gitsigns_delete })
hi("GitSignsTopDelete", { fg = colors.gitsigns_delete })
hi("GitSignsChangeDelete", { fg = colors.gitsigns_change })

hi("GitSignsStagedAdd", { fg = "#7a9a54" })
hi("GitSignsStagedChange", { fg = "#8b7e4f" })
hi("GitSignsStagedDelete", { fg = "#8b4a47" })
hi("GitSignsStagedTopDelete", { fg = "#8b4a47" })
hi("GitSignsStagedChangeDelete", { fg = "#8b7e4f" })

hi("GitSignsAddNr", { fg = colors.gitsigns_add })
hi("GitSignsChangeNr", { fg = colors.gitsigns_change })
hi("GitSignsDeleteNr", { fg = colors.gitsigns_delete })
hi("GitSignsTopDeleteNr", { fg = colors.gitsigns_delete })
hi("GitSignsChangeDeleteNr", { fg = colors.gitsigns_change })
hi("GitSignsUntrackedNr", { fg = colors.gitsigns_add })

hi("GitSignsStagedAddNr", { fg = "#7a9a54" })
hi("GitSignsStagedChangeNr", { fg = "#8b7e4f" })
hi("GitSignsStagedDeleteNr", { fg = "#8b4a47" })
hi("GitSignsStagedTopDeleteNr", { fg = "#8b4a47" })
hi("GitSignsStagedChangeDeleteNr", { fg = "#8b7e4f" })

hi("GitSignsAddLn", { bg = colors.gitsigns_add_dark })
hi("GitSignsChangeLn", { bg = colors.gitsigns_change_dark })
hi("GitSignsDeleteLn", { bg = colors.gitsigns_delete_dark })
hi("GitSignsTopDeleteLn", { bg = colors.gitsigns_delete_dark })
hi("GitSignsChangeDeleteLn", { bg = colors.gitsigns_change_dark })
hi("GitSignsUntrackedLn", { bg = colors.gitsigns_add_dark })

hi("GitSignsStagedAddLn", { bg = "#4a5a34" })
hi("GitSignsStagedChangeLn", { bg = "#5b5e2f" })
hi("GitSignsStagedDeleteLn", { bg = "#5b3a37" })
hi("GitSignsStagedTopDeleteLn", { bg = "#5b3a37" })
hi("GitSignsStagedChangeDeleteLn", { bg = "#5b5e2f" })

hi("GitSignsAddCul", { fg = colors.gitsigns_add })
hi("GitSignsChangeCul", { fg = colors.gitsigns_change })
hi("GitSignsDeleteCul", { fg = colors.gitsigns_delete })
hi("GitSignsTopDeleteCul", { fg = colors.gitsigns_delete })
hi("GitSignsChangeDeleteCul", { fg = colors.gitsigns_change })
hi("GitSignsUntrackedCul", { fg = colors.gitsigns_add })

hi("GitSignsStagedAddCul", { fg = "#7a9a54" })
hi("GitSignsStagedChangeCul", { fg = "#8b7e4f" })
hi("GitSignsStagedDeleteCul", { fg = "#8b4a47" })
hi("GitSignsStagedTopDeleteCul", { fg = "#8b4a47" })
hi("GitSignsStagedChangeDeleteCul", { fg = "#8b7e4f" })

hi("GitSignsAddPreview", { bg = colors.gitsigns_add_dark })
hi("GitSignsDeletePreview", { bg = colors.gitsigns_delete_dark })
hi("GitSignsCurrentLineBlame", { fg = colors.dark_gray, italic = true })
hi("GitSignsNoEOLPreview", { fg = colors.gitsigns_delete })

hi("GitSignsAddInline", { bg = colors.gitsigns_add_dark })
hi("GitSignsDeleteInline", { bg = colors.gitsigns_delete_dark })
hi("GitSignsChangeInline", { bg = colors.gitsigns_change_dark })

hi("GitSignsAddLnInline", { bg = colors.gitsigns_add_dark })
hi("GitSignsChangeLnInline", { bg = colors.gitsigns_change_dark })
hi("GitSignsDeleteLnInline", { bg = colors.gitsigns_delete_dark })

hi("GitSignsDeleteVirtLn", { bg = colors.gitsigns_delete_dark })
hi("GitSignsDeleteVirtLnInLine", { bg = colors.gitsigns_delete_dark })
hi("GitSignsVirtLnum", { fg = colors.gitsigns_delete })

-- Diagnostics
-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================

-- -- Signs (Gutter symbols)
-- hi("DiagnosticSignError", { fg = colors.red, bold = true })
-- hi("DiagnosticSignWarn", { fg = colors.yellow, bold = true })
-- hi("DiagnosticSignInfo", { fg = colors.light_gray })
-- hi("DiagnosticSignHint", { fg = colors.green })
--
-- -- Virtual Text (Inline messages)
-- hi("DiagnosticVirtualTextError", { fg = colors.red, bg = colors.bg, italic = true })
-- hi("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.bg, italic = true })
-- hi("DiagnosticVirtualTextInfo", { fg = colors.light_gray, bg = colors.bg, italic = true })
-- hi("DiagnosticVirtualTextHint", { fg = colors.green, bg = colors.bg, italic = true })
--
-- -- Floating Windows & Popups
-- hi("DiagnosticFloatingError", { fg = colors.red })
-- hi("DiagnosticFloatingWarn", { fg = colors.yellow })
-- hi("DiagnosticFloatingInfo", { fg = colors.light_gray })
-- hi("DiagnosticFloatingHint", { fg = colors.green })

-- Underlines / Undercurls (Code diagnostics)
-- hi("DiagnosticUnderlineError", { underline = true, undercurl = true, sp = colors.red })
-- hi("DiagnosticUnderlineWarn", { underline = true, undercurl = true, sp = colors.yellow })
-- hi("DiagnosticUnderlineInfo", { underline = true, sp = colors.light_blue })
-- hi("DiagnosticFloatingInfo", { fg = colors.light_blue })
-- hi("DiagnosticUnderlineHint", { underline = true, undercurl = true, sp = colors.green })

-- General fallback labels
-- hi("DiagnosticError", { fg = colors.red })
-- hi("DiagnosticWarn", { fg = colors.yellow })
-- hi("DiagnosticUnderlineInfo", { fg = colors.light_blue })
-- hi("DiagnosticHint", { fg = colors.green })
-- hi("DiagnosticOk", { fg = colors.green })
