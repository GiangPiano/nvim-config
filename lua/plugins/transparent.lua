return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	priority = 1001,
	config = function()
		-- Optional, you don't have to run setup.
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"NormalFloat",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- additional groups that should be cleared
			extra_groups = {
				"Normal",
				"NormalNC",
				"TelescopeBorder",
				"NvimTreeNormal",
				"BlinkCmpMenu",
				"BlinkCmpMenuBorder",
				"BlinkCmpDoc",
				"BlinkCmpDocBorder",
				"BlinkCmpKind",
			},
			-- table: groups you don't want to clear
			exclude_groups = {},
		})
	end,
}
