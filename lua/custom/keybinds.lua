-- lua/custom/keybinds.lua

-- Move current line down/up in normal mode
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Center window when moving with ctrl u/d
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

-- Write/quit with leader w/q
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- actually go to definition
vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', { desc = 'lsp definition' })
-- go to references
vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', { desc = 'lsp references' })

-- open diagnostic float
vim.keymap.set('n', '<leader>c', function()
  vim.diagnostic.open_float()
end, { desc = 'open diagnostic float' })
