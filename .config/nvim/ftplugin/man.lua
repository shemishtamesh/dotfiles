vim.keymap.set('n', 'Q', ':q!<CR>')
vim.api.nvim_create_user_command("Q", "q!", {})

vim.cmd(':%s/.//g')
vim.cmd(':0')

