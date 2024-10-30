return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local is_pyline_installed = vim.fn.executable("pylint") == 1
		local is_eslint_installed = vim.fn.executable("eslint") == 1

		lint.linters_by_ft = {
			javascript = { "eslint_d", "eslint" },
			typescript = is_eslint_installed and { "eslint_d", "eslint" } or {},
			javascriptreact = { "eslint_d", "eslint" },
			typescriptreact = { "eslint_d", "eslint" },
			python = is_pyline_installed and { "pylint" } or {},
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- ignore eslint config file not found error
		lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
			if diagnostic.message:find("Error: Could not find config file") then
				---@diagnostic disable-next-line: return-type-mismatch
				return nil
			end
			return diagnostic
		end)

		lint.linters.eslint_d.args = {
			"--no-warn-ignored",
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
