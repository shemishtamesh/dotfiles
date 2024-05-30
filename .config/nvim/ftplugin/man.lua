-- exit keybindings
vim.keymap.set('n', 'Q', ':q<CR>')
vim.keymap.set('n', 'q', ':q<CR>')

-- jump to referenced page
vim.keymap.set('n', 'gd', ':Man <C-R><C-W><C-F>"tyi("_da(bPa <CR>')

-- remove control characters and jump to first line
pcall(function() vim.cmd(':%s///g') end)
vim.cmd(':0')
vim.cmd('set laststatus=0 ruler')
vim.o.number = false

