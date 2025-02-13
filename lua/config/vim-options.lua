vim.cmd.colorscheme("vague")
vim.o.showmode = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- Line number config

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#bafc03", bold = true })
-- Leader key
vim.g.mapleader = " "
vim.keymap.set("n", ";", ":")
-- Search config
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Leave lines when scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- vim.opt.colorcolumn = "120"
-- Make all backgrounds transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- switch between panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- paste over highlight word
vim.keymap.set("x", "<leader>p", '"_dP')

-- add empty line
vim.keymap.set("n", "<Enter>", ":call append(line('.'), '')<CR>j")

-- Diagnosis
-- vim.diagnostic.config({
--     virtual_text = false,
--     virtual_lines = true
-- })
-- vim.keymap.set('', '<leader>l',
--     require("lsp-lines").toggle,
-- { desc = 'Toggle diagnostic virtual_lines' })

