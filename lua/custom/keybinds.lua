-- lua/custom/keybinds.lua

-- Move current line down/up in normal mode
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Center window when moving with ctrl u/d
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

-- Write with leader w
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
