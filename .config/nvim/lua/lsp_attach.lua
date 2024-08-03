return function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- lsp keymaps
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>le", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>le", require('telescope.builtin').lsp_references, opts)
    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

    -- -- dap keymaps
    -- vim.keymap.set('n', '<leader>dc', require('dap').continue)
    -- vim.keymap.set('n', '<leader>do', require('dap').step_over)
    -- vim.keymap.set('n', '<leader>di', require('dap').step_into)
    -- vim.keymap.set('n', '<leader>du', require('dap').step_out)
    -- vim.keymap.set('n', '<Leader>db', require('dap').toggle_breakpoint)
    -- vim.keymap.set('n', '<Leader>dl', function()
    --     require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    -- end)
    -- vim.keymap.set('n', '<leader>dr', require('dap').run_last)
    -- vim.keymap.set('n', '<leader>dq', require('dap').disconnect)
    -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    --   require('dap.ui.widgets').hover()
    -- end)

    -- telescope keymaps
    vim.keymap.set('n', '<Leader>fd', require('telescope.builtin').diagnostics)

    -- local wk = require("which-key")
    -- wk.register({
    --     l = {
    --         name = "lsp",
    --         s = "workspace symbol",
    --         d = "open float diagnostic",
    --         a = "code action",
    --         e = "references",
    --         n = "rename",
    --         f = "format",
    --         K = "hover",
    --     },
    --     -- d = {
    --     --     name = "debug",
    --     --     c = "continue",
    --     --     o = "step over",
    --     --     i = "step into",
    --     --     u = "step out",
    --     --     b = "break point",
    --     --     l = "log point",
    --     --     r = "run last",
    --     --     q = "disconnect",
    --     --     h = "hover",
    --     -- },
    -- }, {prefix = "<leader>"})
end

