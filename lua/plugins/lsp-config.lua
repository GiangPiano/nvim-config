return {
    "neovim/nvim-lspconfig",
    enabled = false,
    event = 'VeryLazy',
    dependencies = {
        { "williamboman/mason.nvim" },
        -- { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        require("mason").setup()
        -- require("mason-lspconfig").setup {
        --     ensure_installed = { "lua_ls", "clangd", "pylsp", "ts_ls", "cssls", "html", "lemminx" },
        -- }
        -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.lsp.enable({ 'lua_ls', 'clangd' })
        vim.lsp.config('clangd', {})
        -- vim.lsp.config('clangd', {})
        -- vim.lsp.config('cssls', { capabilities = capabilities, })
        -- vim.lsp.config('html', { capabilities = capabilities, })
        vim.lsp.config('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = { ignore = {'W391', 'E302', 'E305'} }
                    }
                }
            }
        })
        -- vim.lsp.config('lemminx', {
        --     capabilities = capabilities,
        --     filetype = { "xml", "fxml" },
        -- })
        -- vim.lsp.config('ts_ls', {
        --     capabilities = capabilities,
        --     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        --     -- root_dir = make_root_dir("index.html", "tsconfig.json", "jsconfig.json", "package.json", ".git"),
        --     single_file_support = true,
        -- })
        vim.lsp.config('lua_ls', {
            -- capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "Snacks" },
                    },
                },
            },
        })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
