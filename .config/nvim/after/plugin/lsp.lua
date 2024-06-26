local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
    'pylsp',
    'ltex',
    'clangd',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<CR>'] = nil

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

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- remove sign icons (to leave space for gitsigns
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

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
})

