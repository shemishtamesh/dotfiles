local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
    'pylsp',
    'ltex',
    --'cpptools'  -- TODO: find a way to get a c lsp
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
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

