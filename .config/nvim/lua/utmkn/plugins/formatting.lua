return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.format({
			async = true,
			lsp_fallback = "fallback",
		})

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				lua = { "stylua" },
				python = { "ruff_format" },
				rust = { "rustfmt" },
			},
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil

			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end

			conform.format({
				async = true,
				lsp_fallback = "fallback",
				range = range,
			})
		end, { range = true, desc = "Format file or range (in visual mode)" })
		vim.keymap.set(
			"n",
			"<leader>o",
			":Format<CR>:w<CR>",
			{ noremap = true, silent = true, desc = "Format file and save" }
		)
	end,
}
