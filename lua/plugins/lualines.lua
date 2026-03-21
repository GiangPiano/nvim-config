return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- enabled = false,
	config = function()
		require("lualine").setup({
			options = {
				-- theme = 'auto', -- Keep your preferred theme
				icons_enabled = true,
				section_separators = { left = "", right = "" }, -- Remove separators
				component_separators = { left = "", right = "" }, -- Remove component separators
			},
			sections = {
				lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
			},
		})
	end,
}
