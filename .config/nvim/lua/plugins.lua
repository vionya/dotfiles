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
    use 'nvim-tree/nvim-tree.lua'
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

    -- ** QoL **

    -- automatically pair up parens and stuff
    use 'jiangmiao/auto-pairs'
    -- surround tools
    use 'tpope/vim-surround'
    -- i dont remember what this one does but sure
    use 'lukas-reineke/indent-blankline.nvim'

    -- ** CODE TOOLS **

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    -- LSP
    use 'neovim/nvim-lspconfig'
    -- Rust support
    use 'rust-lang/rust.vim'
    -- code outline
    use({
        "stevearc/aerial.nvim",
        config = function()
            vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
            require("aerial").setup()
        end,
    })
end)
