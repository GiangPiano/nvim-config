vim.opt.termguicolors = true
require("core.lazy")
require("config.options")
require("config.keymaps")
require("core.lsp")
-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

vim.filetype.add({
	extension = {
		fxml = "xml",
	},
})
