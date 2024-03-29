vim.keymap.set('', '<C-n>', ':NvimTreeToggle<CR>', {})

vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', {noremap = true})
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>', {noremap = true})
vim.keymap.set('n', '<A-i>', '<Cmd>BufferPin<CR>')
vim.keymap.set('n', '<A-q>', '<Cmd>BufferClose<CR>', {noremap = true})

-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
