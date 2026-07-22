return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			usePlaceholders = true,
			staticcheck = true,
			analyses = {
				ST1000 = false,
			},
			codelenses = {
				test = true,
			},
		},
	},
}
