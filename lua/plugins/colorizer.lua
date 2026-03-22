return {
	"norcalli/nvim-colorizer.lua",
	-- enabled = false,
	event = "BufRead",
	config = function()
		require("colorizer").setup()
	end,
}
