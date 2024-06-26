local opt = vim.opt
local g = vim.g

opt.hlsearch = true -- jump incrementally to search results
opt.backup = false -- Some servers have issues with backup files, see #649
opt.relativenumber = true -- Enable relative line numbers
opt.incsearch = true -- Searches for strings incrementally
opt.scrolloff = 1 -- Minimal number of screen lines to keep above and below the cursor
opt.colorcolumn = "0" -- removed bar by setting it to 0, but can set the width of bar to 120 if desired
opt.signcolumn = "yes" -- Keep the sign column always visible
opt.splitright = true -- Splitting a window will put the new window right of the current one
opt.splitbelow = true -- Splitting a window will put the new window below the current one
opt.swapfile = false -- Don't keep swap file
opt.expandtab = true -- Use spaces instead of tabs
opt.number = true -- Show line numbers
opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
opt.undofile = true -- Maintain undo history between sessions
opt.updatetime = 300 -- faster completion (4000ms default)
opt.shell = "zsh" -- zsh, always...
opt.mouse = "a" -- Enable mouse for normal and visual modes
opt.tabstop = 4 -- Number of columns per tab
opt.ignorecase = true -- Always case-insensitive
opt.smartcase = true -- Enable smart-case search
opt.shiftwidth = 4 -- Number of auto-indent spaces
opt.softtabstop = 4 -- Number of spaces per Tab
opt.smarttab = true -- A <Tab> in front of a line inserts blanks according to 'shiftwidth'
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.smartindent = true
opt.termguicolors = true
opt.spell = false
opt.spelllang = "en_us"
opt.spelloptions = "camel" -- Treat parts of camelCase words as separate words
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.conceallevel = 3 -- Neorg, display as expected
opt.foldmethod = "indent" -- Folding configuration
opt.foldlevelstart = 99 -- All folds below that level are closed on new buffers
opt.showmatch = true -- Highlights matching brackets
opt.showtabline = 2 -- Always show tabline
opt.laststatus = 3 -- Always show a global status line of the active window
opt.autoread = false -- Ask before reloading a file changed outside of Neovim
opt.foldminlines = 1 -- Fold even single line
opt.showmode = false -- remove insert/normal mode returned at bottom of lualine bar
opt.fillchars = { eob = " " } -- remove tilde at the end of the file
g.gitblame_enabled = 0
g.nvim_tree_auto_open = 0 -- this doesn't play well with barbar
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 0
g.barbar_auto_setup = false
g.nvim_tree_hide_dotfiles = 1 --"0 by default, this option hides files and folders starting with a dot `.`
