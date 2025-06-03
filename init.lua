vim.opt.termguicolors = true
require("core.lazy")
require("core.lsp")
require("config.options")
require("config.keymaps")
-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

vim.filetype.add({
  extension = {
    fxml = "xml",
  }
})
