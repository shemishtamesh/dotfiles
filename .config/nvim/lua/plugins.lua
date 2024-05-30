local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local status, packer = pcall(require, "packer")
-- if not status then
--     print("Packer is not installed")
--     return
-- end

-- -- Reloads Neovim after whenever you save plugins.lua
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup END
-- ]])

require('lazy').setup({
    'nvim-telescope/telescope-file-browser.nvim',
    'mbbill/undotree',  -- for viewing and navigating the undo tree
    'sitiom/nvim-numbertoggle',  -- relative numbers in current buffer normal mode, otherwise absolute numbers
    'simrat39/rust-tools.nvim',  -- for working with rust
    'vimwiki/vimwiki',
    'tbabej/taskwiki',
    'folke/trouble.nvim', -- inlay errors
    'nvim-tree/nvim-web-devicons', -- inlay errors
    'nvim-lualine/lualine.nvim', -- A better statusline
    'stevearc/dressing.nvim',
    'folke/zen-mode.nvim',
    'numToStr/Comment.nvim',
    'lervag/vimtex',
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-surround',
    'norcalli/nvim-colorizer.lua',
    'Exafunction/codeium.vim',
    'David-Kunz/gen.nvim',
    'habamax/vim-asciidoctor',
    'DanilaMihailov/beacon.nvim',
    'christoomey/vim-tmux-navigator',

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly'
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
        },
    },  -- Telescope

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    },  -- Treesitter Syntax Highlighting and more text objects

    -- { 'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap'} },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'hrsh7th/cmp-cmdline'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional

            -- inlay hints
            {'simrat39/inlay-hints.nvim'}
        }
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 4000
        end
    },

    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup {}
        end
    },

    {
      'mikesmithgh/kitty-scrollback.nvim',
      enabled = true,
      lazy = true,
      cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
      event = { 'User KittyScrollbackLaunch' },
      config = function()
          require('kitty-scrollback').setup({
              global = function()
                  return {
                      status_window = {
                          show_timer = true,
                          icons = {
                              kitty = '',
                              heart = '',
                          }
                      },
                  }
              end
          })
      end,
    },
})

