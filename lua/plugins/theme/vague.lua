return {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vague").setup({
            transparent = true,
        })
    end,
}
