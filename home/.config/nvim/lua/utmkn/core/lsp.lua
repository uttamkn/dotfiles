vim.lsp.enable({ "gopls", "ruff", "pylsp", "clangd", "lua_ls", "dockerls", "jsonls" })
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })

			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end, { buffer = ev.buf })
		end
	end,
})
