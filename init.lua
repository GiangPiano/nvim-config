vim.opt.termguicolors = true
require("config.lazy")
require("config.vim-options")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

vim.filetype.add({
  extension = {
    fxml = "xml",
  }
})
