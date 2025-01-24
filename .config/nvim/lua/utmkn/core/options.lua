vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = false
opt.number = false

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tab
opt.shiftwidth = 2 -- 2 spaces for indentation
opt.expandtab = true
opt.autoindent = true
opt.wrap = false

-- undo settings
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- color scheme things
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
-- opt.clipboard:append("unnamedplus") --use system clipboard as default register

--split windows
opt.splitright = true
opt.splitbelow = true
