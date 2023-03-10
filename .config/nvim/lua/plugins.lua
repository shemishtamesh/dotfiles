local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Dashboard is a nice start screen for nvim
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = ' Update', group = '@property', action = 'PackerUpdate', key = 'u' },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        icon = 'ℹ️ ',
                        icon_hl = '@variable',
                        desc = 'Vimwiki',
                        group = 'Label',
                        action = 'VimwikiIndex',
                        key = 'w',
                    },
                    {
                        icon = '❌',
                        icon_hl = '@variable',
                        desc = 'Quit',
                        group = 'Label',
                        action = 'q',
                        key = 'q',
                    },
                },
            },
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }

    use { "bluz71/vim-moonfly-colors", as = "moonfly" }

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })
    use("nvim-telescope/telescope-file-browser.nvim")

    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})  -- Treesitter Syntax Highlighting

    use("mbbill/undotree")  -- for viewing and navigating the undo tree

    use('tpope/vim-fugitive')  -- git integration

    use { "sitiom/nvim-numbertoggle" }  -- relative numbers in current buffer normal mode, otherwise absolute numbers

    use 'simrat39/rust-tools.nvim'  -- for working with rust

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional

            -- inlay hints
            {'simrat39/inlay-hints.nvim'}
        }
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {"vimwiki/vimwiki"}
    use {"tbabej/taskwiki"}

    --use("folke/trouble.nvim") -- inlay errors
    use("nvim-lualine/lualine.nvim") -- A better statusline

--    use {
--      "folke/which-key.nvim",
--      config = function()
--        vim.o.timeout = true
--        vim.o.timeoutlen = 300
--      end
--    }
--
--    -- File management --
--    use("vifm/vifm.vim")
--    use("scrooloose/nerdtree")
--    use("tiagofumo/vim-nerdtree-syntax-highlight")
--    use("ryanoasis/vim-devicons")
--
--    -- Tim Pope Plugins --
--    use("tpope/vim-surround")
--
--    -- Syntax Highlighting and Colors --
--    use("PotatoesMaster/i3-vim-syntax")
--    use("kovetskiy/sxhkd-vim")
--    use("vim-python/python-syntax")
--    use("nickeb96/fish.vim")
--
--    -- Junegunn Choi Plugins --
--    use("junegunn/goyo.vim")
--    use("junegunn/limelight.vim")
--    use("junegunn/vim-emoji")
--
--    -- Colorschemes --
--    use("RRethy/nvim-base16")
--    use("kyazdani42/nvim-palenight.lua")
--
--    -- Other stuff --
--    use("frazrepo/vim-rainbow")

    if packer_bootstrap then
        packer.sync()
    end
end)

