return {
	"ojroques/nvim-osc52",
	config = function()
		local osc52 = require("osc52")
		osc52.setup()
		vim.keymap.set("n", "<leader>y", osc52.copy_operator)
		vim.keymap.set("x", "<leader>y", osc52.copy_visual)

		vim.keymap.set("n", "<leader>yy", function()
			osc52.copy_register('"')
		end)
	end,
}
