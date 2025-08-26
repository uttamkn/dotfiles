vim.cmd("let g:netrw_liststyle = 3")

local set = vim.opt

set.relativenumber = false
set.number = false

-- tabs and indentation
set.tabstop = 2 -- 2 spaces for tab
set.shiftwidth = 2 -- 2 spaces for indentation
set.expandtab = true
set.autoindent = true
set.wrap = false

-- undo settings
set.swapfile = false
set.backup = false
set.undofile = true

-- search settings
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- cursor line
set.cursorline = true

-- color scheme things
set.signcolumn = "yes"

-- backspace
set.backspace = "indent,eol,start"

--clipboard
-- opt.clipboard:append("unnamedplus") --use system clipboard as default register

--split windows
set.splitright = true
set.splitbelow = true
