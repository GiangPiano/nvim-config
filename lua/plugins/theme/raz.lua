local colors = {
	-- bg = "#000000",
	bg = "#050505",
	white = "#ffffff",
	fg = "#eeeeee",
	light_gray = "#a6a4a4",
	gray = "#807d7d",
	dark_gray = "#444455",
	dark_blue = "#111144",
	green = "#23b521",
	yellow = "#dddd44",
	light_yellow = "#ffbbbb",
	red = "#ff0000",
}

local function setup()
	vim.cmd("hi clear")

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.o.termguicolors = true

	local hi = function(group, opts)
		local command = { "hi", group }
		if opts.fg then
			table.insert(command, "guifg=" .. opts.fg)
		end
		if opts.bg then
			table.insert(command, "guibg=" .. opts.bg)
		end
		if opts.style then
			table.insert(command, "gui=" .. opts.style)
		end
		vim.cmd(table.concat(command, " "))
	end

	-- Define highlights
	hi("Normal", { fg = colors.fg, bg = colors.bg })
	hi("Comment", { fg = colors.dark_gray, style = "italic" })
	hi("String", { fg = colors.green, style = "italic" })
	hi("Variable", { fg = colors.fg })
	hi("Function", { fg = colors.light_yellow })
	hi("Keyword", { fg = colors.yellow })
	hi("Type", { fg = colors.gray })
	hi("@type.builtin", { fg = colors.gray })
	hi("Identifier", { fg = colors.fg })
	hi("Special", { fg = colors.fg, style = "bold" })
	-- hi("Constant", { fg = colors.light_gray })
	hi("Delimiter", { fg = colors.gray })
	hi("Operator", { fg = colors.light_gray })
	hi("CursorLineNr", { fg = colors.yellow, style = "bold" })
	hi("CursorLine", { bg = colors.bg })
	hi("ColorColumn", { bg = colors.bg })
	hi("Cursor", { fg = colors.dark_gray, bg = colors.dark_gray })
	hi("Error", { fg = colors.red })
	hi("Warning", { fg = colors.yellow })
	hi("VertSplit", { fg = colors.dark_gray })
	-- Custom
	hi("@attribute", { fg = colors.gray })
	hi("@keyword.directive", { fg = colors.gray })
	hi("@keyword.import", { fg = colors.gray })
	hi("@constructor", { fg = colors.gray })
	hi("GitSignsAdd", { fg = "#B5E48C" }) -- Light Green
	hi("GitSignsChange", { fg = "#FDEAAD" }) -- Pale Yellow
	hi("GitSignsDelete", { fg = "#F07167" }) -- Soft Red
	-- Specific Language
	-- markdown
	hi("RenderMarkdownCode", { bg = colors.dark_blue })
	-- tsx
	hi("@tag.attribute.tsx", { fg = colors.gray })
	hi("@tag.builtin.tsx", { fg = colors.light_gray })
	hi("@tag.component.tsx", { fg = colors.light_gray })
	hi("@include.identifier.tsx", { fg = colors.fg })
end

return {
	"raz",
	dir = vim.fn.stdpath("config"), -- Points to ~/.config/nvim
	setup = setup,
}
