return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 20,
			open_mapping = [[<c-t>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
		})

		-- Custom keymaps to execute commands in terminal mode
		local keymap = vim.keymap
		keymap.set(
			"n",
			"<leader>tr",
			"<cmd>TermExec cmd='g++ solution.cpp && ./a.out && rm a.out'<cr>",
			{ desc = "Run solution.cpp file" }
		)
	end,
}
