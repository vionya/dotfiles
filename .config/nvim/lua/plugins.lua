vim.cmd [[packadd packer.nvim]]

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- ** UI **

    -- color schemes
    use 'Shatur/neovim-ayu'
    use "rebelot/kanagawa.nvim"
    use { "rose-pine/neovim", as = "rose-pine" }
    use 'soft-aesthetic/soft-era-vim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'junegunn/seoul256.vim'
    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end}
        -- status bar
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = false }
        }
        -- fancy tab bar
        use {
            'romgrk/barbar.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = false }
        }
        -- fancy notifications
        use 'rcarriga/nvim-notify'
        -- git UI
        use {
            'NeogitOrg/neogit',
            requires = {
                { 'nvim-lua/plenary.nvim', opt = false },
                { 'sindrets/diffview.nvim', opt = false },
                { 'nvim-telescope/telescope.nvim', opt = true }
            },
            config = function()
                require('neogit').setup {}
            end
        }
        -- transparency
        --[[
        use {
            'xiyaowong/transparent.nvim',
            config = function()
                require('transparent').setup {
                    exclude_groups = {}
                }
            end
        }
        ]]

        -- ** QoL **

        -- automatically pair up parens and stuff
        use 'jiangmiao/auto-pairs'
        -- surround tools
        use 'tpope/vim-surround'
        -- i dont remember what this one does but sure
        use 'lukas-reineke/indent-blankline.nvim'

        -- ** CODE TOOLS **

        -- fuzzy finder
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.6',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- faster sorter code for fuzzy finder
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        -- treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
        -- Rust support
        use 'rust-lang/rust.vim'
        -- code outline
        use {
            "stevearc/aerial.nvim",
            config = function()
                vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
                require("aerial").setup()
            end,
        }

        -- ** LSP AND COMPLETION **

        -- LSP
        use 'neovim/nvim-lspconfig'
        -- CMP
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'L3MON4D3/LuaSnip'
        use 'hrsh7th/cmp-cmdline'
        use 'saadparwaiz1/cmp_luasnip'
    end)
