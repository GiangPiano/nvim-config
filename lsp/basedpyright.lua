return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	-- Detect root by git repo, virtualenv, or fallback to current working directory
	root_markers = { ".git", "requirements.txt", ".venv", "setup.py" },
	settings = {
		python = {
			analysis = {
				diagnosticMode = "workspace",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "standard",
				-- Point explicitly to your virtualenv if not auto-detected:
				-- venvPath = '.',
				-- venv = '.venv',
			},
		},
	},
}
