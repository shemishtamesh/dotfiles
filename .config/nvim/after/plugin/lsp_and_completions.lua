-- # LSP:
local lsp = require('lsp-zero')

lsp.preset('recommended')

-- lsp.ensure_installed({
--     'rust_analyzer',
--     'lua_ls',
--     'pylsp',
--     'ltex',
--     'clangd',
-- })

-- remove sign icons (to leave space for gitsigns)
lsp.set_preferences({
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

lsp.on_attach(require('lsp_attach'))

lsp.setup()

require 'lspconfig'.lua_ls.setup {
    on_attach = require('lsp_attach'),
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}

require 'lspconfig'.pylsp.setup {
    on_attach = require('lsp_attach'),
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = { 'W391', 'W503' },
                },
                black = {
                    enabled = true,
                },
                -- pylsp_mypy = {
                --     enabled = true,
                --     ignore_missing_imports = true,
                -- }
            }
        }
    }
}

-- require 'lspconfig'.jsonls.setup {
--     on_attach = require('lsp_attach'),
-- }

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
})

-- # COMPLETION:
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

-- this doesn't work for some reason
cmp_mappings['<Tab>'] = cmp.config.disable
cmp_mappings['<S-Tab>'] = cmp.config.disable
cmp_mappings['<CR>'] = cmp.config.disable
-- -- therefore this
-- vim.keymap.set("n", "<Tab>", "<nop>")
-- vim.keymap.set("n", "<S-Tab>", "<nop>")
-- vim.keymap.set("n", "<CR>", "<nop>")

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

cmp.setup.cmdline('?', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'buffer' }
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'buffer' }
    })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

cmp.setup.filetype({ "sql" }, {
    sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
    },
})

