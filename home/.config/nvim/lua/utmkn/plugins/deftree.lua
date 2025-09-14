return {
	"utmkn/deftree.nvim",
	dev = true,
	config = function()
		vim.keymap.set("n", "<leader>dt", ":DeftreeToggle<CR>")
	end,
}
