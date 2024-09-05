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
				"tsserver",
				"clangd",
				"jdtls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"pyright",
			},
		})

		-- tsserver is deprecated but mason-lspconfig doesn't support ts_ls yet
		mason_lspconfig.setup_handlers({
			-- Will be called for each installed server that doesn't have
			-- a dedicated handler.
			--
			function(server_name) -- default handler (optional)
				-- https://github.com/neovim/nvim-lspconfig/pull/3232
				if server_name == "tsserver" then
					server_name = "ts_ls"
				end
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				require("lspconfig")[server_name].setup({

					capabilities = capabilities,
				})
			end,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"clang-format",
				"google-java-format",
				"stylua",
				"isort",
				"black",
				"eslint_d",
			},
		})
	end,
}
