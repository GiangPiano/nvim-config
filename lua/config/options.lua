-- vim.cmd.colorscheme("rose-pine-moon")
require("plugins.theme.raz").setup()
vim.o.showmode = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
	end,
})

-- Line number config
vim.cmd("set number")
vim.cmd("set relativenumber")
-- vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#bafc03", bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#101015" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#44475a", fg = "White" })
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#44475a", bg = "#ff9e64", bold = true })
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#44475a", fg = "White" })
vim.api.nvim_set_hl(0, "@text.note", { link = "Search" })
vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
