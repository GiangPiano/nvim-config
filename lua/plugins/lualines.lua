return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		-- Reference your custom color palette (ensure the path is correct)
		local colors = {
			bg = "#050505",
			fg = "#eeeeee",
			yellow = "#dddd44",
			green = "#33c531",
			dark_gray = "#444455",
		}

		-- Define a static theme based on your custom colors
		local custom_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
				b = { fg = colors.fg, bg = "NONE" },
				c = { fg = colors.fg, bg = "NONE" },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.green, gui = "bold" },
				b = { fg = colors.fg, bg = "NONE" },
				c = { fg = colors.fg, bg = "NONE" },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.fg, gui = "bold" },
				b = { fg = colors.fg, bg = "NONE" },
				c = { fg = colors.fg, bg = "NONE" },
			},
			inactive = {
				a = { fg = colors.dark_gray, bg = "NONE" },
				b = { fg = colors.dark_gray, bg = "NONE" },
				c = { fg = colors.dark_gray, bg = "NONE" },
			},
		}

		require("lualine").setup({
			options = {
				theme = custom_theme, -- Use the hardcoded dark/transparent theme
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = {
					{
						function()
							return vim.g.codecompanion_status or ""
						end,
						cond = function()
							return (vim.g.codecompanion_status or "") ~= ""
						end,
						color = { fg = "#f9e2af" },
					},
					"encoding",
					{ "fileformat", symbols = { unix = "" } },
					"filetype",
				},
			},
		})
	end,
}
