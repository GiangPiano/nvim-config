-- vim.cmd.colorscheme("rose-pine-moon")
vim.cmd.colorscheme("gemini")
-- require("colors.gemini").setup()
vim.o.showmode = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
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
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#44475a", fg = "White" })
vim.api.nvim_set_hl(0, "@text.note", { link = "Search" })
vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- Blinking cursor
vim.opt.guicursor =
	"n-v-c:block-blinkon200-blinkoff200-blinkwait200,i-ci-ve:ver25-blinkon200-blinkoff200-blinkwait200,r-cr:hor20-blinkon200-blinkoff200-blinkwait200"
