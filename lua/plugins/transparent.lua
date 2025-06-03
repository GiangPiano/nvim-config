return {
    "xiyaowong/transparent.nvim",
    config = function()
        -- Optional, you don't have to run setup.
        require("transparent").setup({
            groups = {
                'Normal',
                'NormalNC',
                'NormalFloat',
                'Comment',
                'Constant',
                'Special',
                'Identifier',
                'Statement',
                'PreProc',
                'Type',
                'Underlined',
                'Todo',
                'String',
                'Function',
                'Conditional',
                'Repeat',
                'Operator',
                'Structure',
                'LineNr',
                'NonText',
                'SignColumn',
                'CursorLineNr',
                'StatusLine',
                'StatusLineNC',
                'EndOfBuffer',
            },
            -- additional groups that should be cleared
            extra_groups = {
                "Normal",
                "NormalNC",
                "TelescopeBorder",
                "NvimTreeNormal",
            },
            -- table: groups you don't want to clear
            exclude_groups = {},
        })
    end,
}
