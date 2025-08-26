return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"clangd",
				"gopls",
				"pyright",
				"html",
				"lua_ls",
				-- "ts_ls",
				-- "cssls",
				-- "tailwindcss",
				-- "rust_analyzer",
				-- "emmet_ls",
				-- "prismals",
				-- "jdtls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"clang-format",
				"stylua",
				"gofumpt",
				"goimports-reviser",
				"ruff",
				-- "google-java-format",
				-- "eslint_d",
			},
		})
	end,
}
