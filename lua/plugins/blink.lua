return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "super-tab" },
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 1000, window = { border = "rounded" } },
			menu = { auto_show = true, auto_show_delay_ms = 500, border = "rounded" },
			ghost_text = { enabled = true },
		},
		signature = { enabled = true, window = { border = "rounded" } },
	},
	opts_extend = { "sources.default" },
}
