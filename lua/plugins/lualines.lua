return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons" },
    event = "VeryLazy",
    -- enabled = false,
    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto', -- Keep your preferred theme
                section_separators = { left = '', right = '' }, -- Remove separators
                component_separators = { left = '', right = '' }, -- Remove component separators
            }
        }
    end,
}
