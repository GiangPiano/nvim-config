return {
    "GiangPiano/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Load and patch lualine theme from vague
        local vague = require("vague")
        vague.setup({
            transparent = true,
        })
    end,
}
