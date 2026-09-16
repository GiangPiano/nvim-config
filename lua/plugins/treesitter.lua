return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	init = function()
		local ensure_installed = {
			"c",
			"cpp",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"typescript",
			"python",
			"markdown",
			"markdown_inline",
			"cmake",
		}
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- Enable treesitter highlighting and disable regex syntax
				pcall(vim.treesitter.start)
				-- Enable treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
