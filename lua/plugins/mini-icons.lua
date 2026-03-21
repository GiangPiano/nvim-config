return {
	"nvim-mini/mini.icons",
	priority = 1001,
	version = "*",
	config = function()
		require("mini.icons").setup()
	end,
}
