-- ftplugin/cpp.lua

-- In ftplugin, 'buffer = true' is essential to keep this map
-- from leaking into your TypeScript or Python files.
-- vim.keymap.set("n", "<leader>k", function()
-- 	local cw = vim.fn.expand("<cword>")
-- 	-- Best practice: Check if the word is empty before launching browser
-- 	if cw == "" then
-- 		return
-- 	end
--
-- 	local opener = vim.fn.has("mac") == 1 and "open" or "xdg-open"
-- 	local url = "https://duckduckgo.com/?q=!cpp+std::" .. cw
-- 	vim.fn.jobstart({ opener, url }, { detach = true })
-- end, { buffer = true, desc = "Search cppreference" })

vim.keymap.set("n", "<leader>k", function()
	local word = vim.fn.expand("<cword>")
	vim.cmd("set splitright | vsplit | terminal cppman " .. word)
	vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
end, { buffer = true })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.keymap.set("n", "q", function()
			vim.fn.jobstop(vim.b.terminal_job_id)
			vim.cmd("close")
		end, { buffer = true })
	end,
})
