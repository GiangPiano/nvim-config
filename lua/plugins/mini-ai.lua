return {
	"nvim-mini/mini.ai",
	event = "BufRead",
	version = "*",
	config = function()
		require("mini.ai").setup({})
	end,
}
