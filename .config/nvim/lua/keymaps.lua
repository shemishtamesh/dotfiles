-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

-- shortcuts for yanking/copying and putting/pasting to and from the system's clipboard
vim.keymap.set("v", "<leader>y", "\"+y:let @*=@+<CR>", { silent = true })
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>Y", "\"+Y:let @*=@+<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")

-- moving code segments
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- center cursor while moving pages/searches
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace current word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/t/gI<Left><Left><Left><BackSpace>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

-- toggle spell check
vim.keymap.set("n", "<leader>sc", "<cmd>setlocal spell! spelllang=en_us<CR>")

-- saving and exiting
vim.api.nvim_create_user_command("W", "wa!", {})
vim.api.nvim_create_user_command("Q", "qa!", {})
vim.api.nvim_create_user_command("Qw", "wqa!", {})
vim.api.nvim_create_user_command("QW", "wqa!", {})
vim.api.nvim_create_user_command("Wq", "wqa!", {})
vim.api.nvim_create_user_command("WQ", "wqa!", {})

-- stop highlighting
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>")

-- hex mode
vim.keymap.set("n", "<leader>h", "<cmd>%!xxd<CR>")
vim.keymap.set("n", "<leader>H", "<cmd>%!xxd -r<CR>")

