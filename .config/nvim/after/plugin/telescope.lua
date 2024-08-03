local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fl", builtin.live_grep)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
vim.keymap.set("n", "<leader>fs", builtin.grep_string)
vim.keymap.set("n", "<leader>fc", builtin.command_history)
vim.keymap.set("n", "<leader>fq", builtin.quickfix)
vim.keymap.set("n", "<leader>fj", builtin.jumplist)
vim.keymap.set("n", "<leader>fk", builtin.keymaps)

-- local wk = require("which-key")
-- wk.register({
--     f = {
--         name = "find",
--         f = "file",
--         l = "live grep",
--         g = "in git",
--         o = "old",
--         s = "grep string",
--         c = "command history",
--         q = "quickfix",
--         j = "jumplist",
--         k = "keymaps",
--     }
-- }, {prefix = "<leader>"})
