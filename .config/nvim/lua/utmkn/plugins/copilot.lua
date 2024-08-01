return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable copilot" })
		vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable copilot" })
	end,
}
