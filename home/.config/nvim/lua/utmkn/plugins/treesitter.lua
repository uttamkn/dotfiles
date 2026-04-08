vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"python",
		"c",
		"cpp",
		"json",
		"bash",
		"lua",
		"fish",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"python",
			"go",
			"json",
			"yaml",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"fish",
		},
		auto_install = true,
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		indent = { enable = true },
		autotag = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				node_decremental = "<bs>",
			},
		},
	},
}
