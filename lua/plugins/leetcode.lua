return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	cmd = { "Leet" },
	opts = {
		-- leetcode.nvim options here
	},
	config = function(_, opts)
		require("leetcode").setup(opts)

		vim.api.nvim_create_user_command("LeetCopy", function()
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

			-- 1. Extract only the code between @leet start and @leet end / @leet begin
			local code_lines = {}
			local capturing = false

			for _, line in ipairs(lines) do
				if line:match("//%s*@leet%s+end") or line:match("//%s*@leet%s+begin") then
					capturing = false
				end

				if capturing then
					table.insert(code_lines, line)
				end

				if line:match("//%s*@leet%s+start") then
					capturing = true
				end
			end

			-- Fallback to full buffer if tags are not present
			local code = #code_lines > 0 and table.concat(code_lines, "\n") or table.concat(lines, "\n")

			-- 2. Query leetcode.nvim's internal API directly if available
			local title = ""
			local url = ""

			local ok, lc_config = pcall(require, "leetcode.config")
			if ok and lc_config.problem then
				local p = lc_config.problem
				if p.id and p.title then
					title = p.id .. ". " .. p.title
				end
				if p.slug then
					url = "https://leetcode.com/problems/" .. p.slug .. "/"
				end
			end

			-- Fallback to filename parsing if API state is not active
			if url == "" then
				local filename = vim.fn.expand("%:t:r")
				local num, slug = filename:match("(%d+)%.([%w%-]+)")
				if num and slug then
					local formatted_title = slug:gsub("%-", " "):gsub("(%a)([%w_']*)", function(first, rest)
						return first:upper() .. rest
					end)
					title = num .. ". " .. formatted_title
					url = "https://leetcode.com/problems/" .. slug .. "/"
				end
			end

			if title == "" then
				title = "LeetCode Solution"
			end

			-- 3. Format payload
			local formatted_output = string.format("%s\n%s\n||```cpp\n%s\n```||", title, url, code)

			-- 4. Copy to clipboard
			vim.fn.setreg("+", formatted_output)
			vim.fn.setreg("*", formatted_output)

			vim.notify("Copied LeetCode solution to clipboard!", vim.log.levels.INFO)
		end, {})
	end,
}
