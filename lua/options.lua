vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.updatetime = 300
-- Disable termguicolors because this causes Cursor flickering
-- More here: https://github.com/neovim/neovim/issues/2528
-- vim.o.termguicolors = true
vim.o.mouse = '' -- set a for all
vim.cmd("set nofixendofline")
-- Show Whitespaces
vim.cmd("if has('gui_running') || ($TERM == 'xterm-kitty')\
set list listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀\
let &showbreak = '↳'\
else\
set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<\
let &showbreak = '^'\
endif")