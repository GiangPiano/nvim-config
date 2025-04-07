return {
    "neovim/nvim-lspconfig",
    event = 'VeryLazy',
    enable = true,  -- Ensure the plugin is enabled
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        -- Mason setup
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls", "clangd", "pylsp", "ts_ls", "cssls", "html" },
        }

        local lspconfig = require("lspconfig")
        local util = require("lspconfig.util")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- C/C++
        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd"
            },
        })

        -- python
        lspconfig.pylsp.setup{
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {'W391'},
                            maxLineLength = 100
                        }
                    }
                }
            }
        }

        -- Java
        -- lspconfig.jdtls.setup({
        --     capabilities = capabilities,
        -- })

        -- Typescript & Javascript
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })

        -- Lua
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- CSS 
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })

        -- HTML 
        lspconfig.html.setup({
            capabilities = capabilities,
        })

        -- LSP keymap settings
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

        -- List all methods in a file
        vim.keymap.set("n", "<leader>fm", function()
            local filetype = vim.bo.filetype
            local symbols_map = {
                python = "function",
                javascript = "function",
                typescript = "function",
                java = "class",
                lua = "function",
                go = { "method", "struct", "interface" },
            }
            local symbols = symbols_map[filetype] or "function"
            require("telescope.builtin").lsp_document_symbols({ symbols = symbols })
        end, {})
    end,
}

--------------------------------------------------
-- Windows
-- return {
--     "neovim/nvim-lspconfig",
--     event = 'VeryLazy',
--     enable = false,
--     dependencies = {
--         { "williamboman/mason.nvim", },
--         { "williamboman/mason-lspconfig.nvim", },
--     },
--     config = function()
--         require("mason").setup()
--         require("mason-lspconfig").setup {
--             ensure_installed = { "lua_ls" },
--         }
--         local lspconfig = require("lspconfig")
--         local capabilities = require("cmp_nvim_lsp").default_capabilities()
--         -- lua
--         lspconfig.lua_ls.setup({
--             capabilities = capabilities,
--             settings = {
--                 Lua = {
--                     diagnostics = {
--                         globals = { "vim" },
--                     },
--                 },
--             },
--         })
--         lspconfig.jdtls.setup({
--             capabilities = capabilities,
--         })
--         -- typescript
--         lspconfig.ts_ls.setup({
--             capabilities = capabilities,
--         })
--         -- cpp
--         lspconfig.clangd.setup({
--             cmd = { "clangd" },
--             capabilities = require("cmp_nvim_lsp").default_capabilities(),
--             init_options = {
--                 fallbackflags = {
--                     "-std=c++20",
--                     "--target=x86_64-w64-mingw32",
--                     "--gcc-toolchain=d:/program/msys64/ucrt64",
--                     "-i", "d:/program/msys64/ucrt64/include/c++/13.2.0",
--                     "-i", "d:/program/msys64/ucrt64/include"
--                 },
--             },
--         })
--         --html
--         lspconfig.html.setup({
--             capabilities = capabilities
--         })
--         -- lsp keymap setting
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--         vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
--         vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
--         vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
--         vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
--         vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
--         -- list all methods in a file
--         -- working with go confirmed, don't know about other, keep changing as necessary
--         vim.keymap.set("n", "<leader>fm", function()
--             local filetype = vim.bo.filetype
--             local symbols_map = {
--                 python = "function",
--                 javascript = "function",
--                 typescript = "function",
--                 java = "class",
--                 lua = "function",
--                 go = { "method", "struct", "interface" },
--             }
--             local symbols = symbols_map[filetype] or "function"
--             require("telescope.builtin").lsp_document_symbols({ symbols = symbols })
--         end, {})
--     end, -- This correctly closes the `config` function
-- }
