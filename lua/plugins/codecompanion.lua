return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = { "CodeCompanion", "CodeCompanionChat" },
	opts = {
		display = {
			chat = {
				intro_message = "Wassup dawg? Smash ? for help.",
				window = {
					position = "right",
					width = 0.3,
				},
			},
		},
		interactions = {
			chat = {
				-- You can specify an adapter by name and model (both ACP and HTTP)
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:7b",
				},
			},
			-- Or, just specify the adapter by name
			inline = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:7b",
				},
			},
			cmd = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:7b",
				},
			},
			adapters = {
				http = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								name = "ollama",
								model = {
									default = "qwen2.5-coder:7b",
								},
							},
						})
					end,
				},
			},
		},
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
}
