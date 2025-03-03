vim.opt.termguicolors = true
require("config.lazy")
require("config.vim-options")
require("luasnip.loaders.from_lua").load({ paths = "~/AppData/Local/nvim/lua/snippets" })
