return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find files in repo' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    preview = {
                        filesize_limit = 1,  -- Set limit to 1MB
                    },
                    file_ignore_patterns = { "node_modules", "%.pdf", "%.zip", "%.tar", "%.mp4" },  -- Ignore large files
                },
            })
        end,
    }
}
