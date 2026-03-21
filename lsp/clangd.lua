return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	settings = {
		clangd = {
			InlayHints = {
				Designators = false,
				ParameterNames = true,
				DeducedTypes = true,
				BlockEnd = true,
			},
		},
	},
}
