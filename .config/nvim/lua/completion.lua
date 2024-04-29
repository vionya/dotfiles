local cmp = require('cmp')
local mappin = cmp.mapping

cmp.setup({
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = mappin.preset.insert({
        ["<C-k>"] = mappin.select_prev_item(), -- previous suggestion
        ["<C-j>"] = mappin.select_next_item(), -- next suggestion
        ["<C-b>"] = mappin.scroll_docs(-4),
        ["<C-f>"] = mappin.scroll_docs(4),
        ["<C-Space>"] = mappin.complete(), -- show completion suggestions
        ["<C-c>"] = mappin.abort(), -- close completion window
        ["<CR>"] = mappin.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" }, 
        { name = "luasnip" },
    }),


    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })
})
