return function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- lsp keymaps
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lrf", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

    -- dap keymaps
    vim.keymap.set('n', '<leader>dc', require('dap').continue)
    vim.keymap.set('n', '<leader>do', require('dap').step_over)
    vim.keymap.set('n', '<leader>di', require('dap').step_into)
    vim.keymap.set('n', '<leader>du', require('dap').step_out)
    vim.keymap.set('n', '<Leader>db', require('dap').toggle_breakpoint)
    vim.keymap.set('n', '<Leader>dl', function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end)
    vim.keymap.set('n', '<Leader>dr', require('dap').run_last)
    vim.keymap.set('n', '<Leader>dq', require('dap').disconnect)

    -- telescope keymaps
    vim.keymap.set('n', '<Leader>fd', require('telescope.builtin').diagnostics)
end

