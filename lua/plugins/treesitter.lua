return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "css",
        "python",
        "java",
        "tsx",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline"
    },
}
