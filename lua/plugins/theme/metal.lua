return {
    "metalelf0/black-metal-theme-neovim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        require("black-metal").setup({
            -- optional configuration here
            theme = "dark-funeral",
            cursorline_gutter = true,
            diagnostics = {
                darker = false, -- Darker colors for diagnostic
                undercurl = true, -- Use undercurl for diagnostics
                background = false, -- Use background color for virtual text
            },
        })
        require("black-metal").load()
    end,
}
