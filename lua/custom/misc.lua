-- lua/custom/misc.lua

-- linewidth guideline
vim.opt.colorcolumn = '80'
vim.api.nvim_set_hl(0, 'ColorColumn', {
  bg = vim.api.nvim_get_hl(0, { name = 'CursorLine', link = false }).bg, -- test
})
