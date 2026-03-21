return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			-- Conform will formatters_by_ft = {
			c = { "clang_format", lsp_format = "fallback" },
			cpp = { "clang_format", lsp_format = "fallback" },
			-- run the first available formatter
			javascript = { "prettierd", stop_after_first = true },
			typescript = { "prettierd", stop_after_first = true },
			typescriptreact = { "prettierd", stop_after_first = true },
			markdown = { "prettierd", stop_after_first = true },
			-- sql = { "pg_format", lsp_format = "fallback" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		formatters = {
			clang_format = {
				command = "clang-format",
				prepend_args = {
					"--style=file",
				},
			},
		},
	},
}
