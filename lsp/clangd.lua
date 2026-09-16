return {
	cmd = {
		"/opt/homebrew/opt/llvm/bin/clangd",
		"--background-index",
		"--query-driver=/opt/homebrew/bin/g++-16,/opt/homebrew/opt/llvm/bin/clang++",
	},
	init_options = {
		fallbackFlags = { "-std=c++23" },
	},
	filetypes = { "c", "cpp" },
	root_markers = { ".clangd", "compile_commands.json" },
}
