-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

-- Map <leader> to space and <localleader> to \
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- navigating between splits
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- shortcuts for yanking/copying and putting/pasting to and from the system's clipboard
vim.keymap.set("v", "<leader>y", "\"+y:let @*=@+<CR>", { silent = true })
vim.keymap.set("n", "<leader>y", "\"+y")  -- only the + register
vim.keymap.set({ "n", "v" }, "<leader>Y", "\"+Y:let @*=@+<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")

-- moving code segments
vim.keymap.set("n", "<M-j>", "V:m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<M-k>", "V:m '>-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- center cursor while moving pages/searches
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix list navigation
vim.keymap.set("n", "<M-o>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<M-i>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

-- replace current word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/t/gI<Left><Left><Left><BackSpace>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

-- toggle spell check
vim.keymap.set("n", "<leader>sc", "<cmd>setlocal spell! spelllang=en_us<CR>")

-- saving and exiting
vim.keymap.set('n', 'Q', ':qa<CR>')
vim.api.nvim_create_user_command("W", "wa", {})
vim.api.nvim_create_user_command("Q", "qa", {})
vim.api.nvim_create_user_command("Qw", "wqa", {})
vim.api.nvim_create_user_command("QW", "wqa", {})
vim.api.nvim_create_user_command("Wq", "wqa", {})
vim.api.nvim_create_user_command("WQ", "wqa", {})

-- toggle search highlighting highlighting
vim.keymap.set("n", "<leader>n", "<cmd>set hlsearch!<CR>")

-- hex mode
vim.keymap.set("n", "<leader>h", "<cmd>%!xxd<CR>")
vim.keymap.set("n", "<leader>H", "<cmd>%!xxd -r<CR>")

