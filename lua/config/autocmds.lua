-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 100, visual = true })
	end,
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- -- no auto continue comments on new line
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
-- 	callback = function()
-- 		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
-- 	end,
-- })

-- syntax highlighting for dotenv files
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("open fold by default", { clear = true }),
	callback = function()
		vim.cmd("normal! zR")
	end,
})

vim.api.nvim_create_user_command("LspToggle", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })

	if #clients > 0 then
		for _, client in ipairs(clients) do
			vim.lsp.buf_detach_client(bufnr, client.id)
		end
		vim.notify("Detached clangd from buffer", vim.log.levels.INFO)
	else
		vim.cmd("LspStart clangd")
		vim.notify("Started/Attached clangd", vim.log.levels.INFO)
	end
end, {})
