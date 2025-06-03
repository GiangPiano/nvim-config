vim.cmd.colorscheme("vague")
vim.o.showmode = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "typescriptreact" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})

-- Line number config
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#bafc03", bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#101015" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#44475a", fg = "White" })
vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
