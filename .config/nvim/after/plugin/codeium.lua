vim.g.codeium_disable_bindings = 1

vim.keymap.set('i', '<C-D>', function () return vim.fn['codeium#Accept']() end, { expr = true })
