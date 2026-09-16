-- ============================================================================
-- LSP ENABLE
-- ============================================================================
vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"clangd",
	"neocmakelsp",
	"vtsls",
	"cssls",
	"html",
	"phpactor",
	"postgres_lsp",
	"shopify_theme_ls",
})
-- ============================================================================
-- DISABLE SEMANTIC TOKENS
-- ============================================================================
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client then
-- 			client.server_capabilities.semanticTokensProvider = nil
-- 		end
-- 	end,
-- })

-- vim.highlight.priorities.semantic_tokens = 95
-- ============================================================================
-- BASE DIAGNOSTIC CONFIGURATION
-- ============================================================================
local base_diagnostic_config = {
	virtual_text = {
		severity = { vim.diagnostic.severity.ERROR },
		current_line = true,
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚",
			[vim.diagnostic.severity.WARN] = "󰀪",
			[vim.diagnostic.severity.INFO] = "󰋽",
			[vim.diagnostic.severity.HINT] = "󰌶",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "None",
			[vim.diagnostic.severity.INFO] = "None",
			[vim.diagnostic.severity.HINT] = "None",
		},
	},
}

vim.diagnostic.config(base_diagnostic_config)
vim.o.winborder = "rounded"

-- ============================================================================
-- TOGGLE WARNINGS / INFO / HINTS (KEEP ERRORS)
-- ============================================================================
local show_all_diagnostics = true

vim.keymap.set("n", "<leader>d", function()
	show_all_diagnostics = not show_all_diagnostics

	if show_all_diagnostics then
		-- Restore full diagnostics
		vim.diagnostic.config(base_diagnostic_config)
		print("Diagnostics: All severities active")
	else
		-- Filter everything down to ERROR only
		vim.diagnostic.config({
			underline = {
				severity = { min = vim.diagnostic.severity.ERROR },
			},
			signs = {
				text = base_diagnostic_config.signs.text,
				numhl = base_diagnostic_config.signs.numhl,
				severity = { min = vim.diagnostic.severity.ERROR },
			},
			virtual_text = {
				severity = { vim.diagnostic.severity.ERROR },
				current_line = true,
			},
		})
		print("Diagnostics: Errors only")
	end
end, { desc = "Toggle Warnings/Info/Hints (Keep Errors)" })

-- ============================================================================
-- KEYMAPS (Direct Lua Callbacks)
-- ============================================================================
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>l", function()
	vim.diagnostic.open_float({ focusable = true })
end, { desc = "Line Diagnostics Float" })
vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
