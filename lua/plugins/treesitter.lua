return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "python", "cpp", "c", "lua", "vim", "vimdoc", "javascript", "typescript", "css", "html", "java" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
