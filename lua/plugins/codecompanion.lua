return {
	"olimorris/codecompanion.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },

	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat (Default)" },
		{ "<leader>ci", ":CodeCompanion ", mode = { "n", "v" }, desc = "CodeCompanion Inline" },
	},

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
			chat = { adapter = "qwen" },
			inline = { adapter = "qwen" },
			cmd = { adapter = "qwen" },
		},

		adapters = {
			acp = {
				opts = { show_presets = false },
			},

			http = {
				opts = { show_presets = false },

				haiku = function()
					return require("codecompanion.adapters").extend("anthropic", {
						name = "haiku",
						formatted_name = "Anthropic (Claude Haiku)",
						schema = {
							model = {
								default = "claude-3-5-haiku-latest", -- Or claude-haiku-4-5 depending on your tier/version
							},
						},
					})
				end,

				-- Default / Implementation Model
				qwen = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "qwen",
						formatted_name = "Ollama (qwen2.5:0.5b)",
						schema = {
							model = {
								default = "qwen2.5:0.5b",
							},
						},
					})
				end,

				-- Review Model
				llama = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "llama",
						formatted_name = "Ollama (llama3.1:8b)",
						schema = {
							model = {
								default = "llama3.1:8b",
							},
						},
					})
				end,

				-- Reasoning Model (RAG & Later Labs)
				deepseek = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "deepseek",
						formatted_name = "Ollama (deepseek-r1:8b)",
						schema = {
							model = {
								default = "deepseek-r1:8b",
							},
						},
					})
				end,
			},
		},

		opts = {
			log_level = "DEBUG",
		},
	},

	config = function(_, opts)
		require("codecompanion").setup(opts)

		local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		local spinner_index = 1
		local timer = nil

		vim.api.nvim_create_autocmd("User", {
			pattern = "CodeCompanionRequestStarted",
			callback = function()
				if timer then
					timer:stop()
					timer:close()
				end
				timer = vim.uv.new_timer()
				timer:start(
					0,
					80,
					vim.schedule_wrap(function()
						spinner_index = (spinner_index % #spinner_frames) + 1
						vim.g.codecompanion_status = spinner_frames[spinner_index] .. " thinking…"
						vim.cmd("redrawstatus")
					end)
				)
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "CodeCompanionRequestFinished",
			callback = function()
				if timer then
					timer:stop()
					timer:close()
					timer = nil
				end
				vim.g.codecompanion_status = nil
				vim.cmd("redrawstatus")
			end,
		})
	end,
}
