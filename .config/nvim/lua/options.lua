-- interface
vim.opt.termguicolors = true
vim.opt.mouse = ''

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- editing
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.autowrite = true
vim.opt.number = true

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

-- misc
vim.opt.laststatus = 2
vim.g.python3_host_prog = "/usr/bin/python"

-- cursorline autogroup
local cursorlinegrp = vim.api.nvim_create_augroup('cursorlinegrp', {})
vim.api.nvim_create_autocmd(
{'VimEnter', 'WinEnter', 'BufWinEnter'},
{
    pattern = '*',
    callback = function()
        vim.opt_local.cursorline = true
    end,
    group = cursorlinegrp
}
)
vim.api.nvim_create_autocmd(
{'WinLeave'},
{
    pattern = '*',
    callback = function()
        vim.opt_local.cursorline = false
    end,
    group = cursorlinegrp
}
)
