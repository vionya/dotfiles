vim.keymap.set('', '<C-n>', ':NvimTreeToggle<CR>', {})

vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', {noremap = true})
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>', {noremap = true})
vim.keymap.set('n', '<A-i>', '<Cmd>BufferPin<CR>')
vim.keymap.set('n', '<A-q>', '<Cmd>BufferClose<CR>', {noremap = true})
