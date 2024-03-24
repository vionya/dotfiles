require('plugins')
require('colors')
require('bindings')
require('options')
-- require('lsp')
-- this is scuffed rn lol

-- patch in notification replacement
vim.notify = require('notify')

-- plugin setups
require('nvim-tree').setup { on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'T', api.node.open.tab, opts('Open: New Tab'))
end
}

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = false,
    highlight = { enable = true }
}

-- load rich presence program
vim.g.rich_presence_binary = 'target/release/nvimsence-rs'
vim.g.nvimsence_show_buttons = 0
vim.opt.rtp:append('~/Projects/rust/nvimsence.rs')
