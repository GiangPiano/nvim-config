-- Leader key
vim.g.mapleader = " "
vim.keymap.set("n", ";", ":")
-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- switch between panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- paste over highlight word
vim.keymap.set("x", "p", '"_dP')

-- add empty line
vim.keymap.set("n", "<Enter>", ":call append(line('.'), '')<CR>j")
