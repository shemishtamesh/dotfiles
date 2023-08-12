vim.keymap.set('n', 'Q', ':q!<CR>')

pcall(function() vim.cmd(':%s///g') end)
vim.cmd(':0')

