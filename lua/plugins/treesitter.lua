return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"typescript",
				"javascript",
				"html",
				"css",
				"python",
				"java",
				"tsx",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
			},
			highlight = {
				enable = true,
				-- This specifically prevents the "Syntax" fallback you saw earlier
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
