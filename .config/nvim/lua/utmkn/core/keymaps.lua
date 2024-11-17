vim.g.mapleader = " "

local keymap = vim.keymap

-- random shit
keymap.set("n", ",", "<C-r>", { desc = "Redo" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- navigate between windows
keymap.set("n", "<C-j>", "<C-W>j", { desc = "down" })
keymap.set("n", "<C-k>", "<C-W>k", { desc = "up" })
keymap.set("n", "<C-h>", "<C-W>h", { desc = "left" })
keymap.set("n", "<C-l>", "<C-W>l", { desc = "right" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- terminal
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-W>j", { desc = "down" })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-W>k", { desc = "up" })
keymap.set("t", "<C-h>", "<C-\\><C-n><C-W>h", { desc = "left" })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-W>l", { desc = "right" })

-- Copy to clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy to clipboard" })

-- Paste from clipboard
keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
