-- show substitution preview
vim.o.inccommand = 'split'

-- set gui colors for terminal
vim.o.termguicolors = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Number of screen lines to keep above and below the cursor
vim.o.scrolloff = 8

-- Better editor UI
vim.o.number = true
vim.o.numberwidth = 1
vim.o.relativenumber = true
-- vim.o.signcolumn = "yes"
-- vim.o.cursorline = false
-- vim.opt.cmdheight = 0

-- Better editing experience
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.autoindent = true
vim.o.wrap = false
-- vim.o.textwidth = 300
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- If negative, shiftwidth value is used
vim.o.list = true
vim.o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
--vim.o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- vim.o.formatoptions = 'qrn1'

-- color the 80th color, a hint for when a line is too long
vim.opt.colorcolumn = "80"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Undo and backup options
-- vim.o.backup = false
-- vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backupdir = '/tmp/'
vim.o.directory = '/tmp/'
vim.o.undodir = '/tmp/'

-- Remember 100 items in commandline history
vim.o.history = 100

-- Better buffer splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- enable mouse support
vim.opt.mouse = "a"

