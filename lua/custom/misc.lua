-- lua/custom/misc.lua

-- linewidth guideline
vim.opt.colorcolumn = { '80', '100' }
vim.api.nvim_set_hl(0, 'ColorColumn', {
  bg = vim.api.nvim_get_hl(0, { name = 'CursorLine', link = false }).bg, -- test
})

-- python format on write (ruff)
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.py',
  callback = function()
    -- Try formatting with Ruff only if it exists and succeeds
    local file = vim.fn.expand '%:p'
    local cmd = 'uvx ruff format ' .. vim.fn.shellescape(file)

    -- Run the formatter, but suppress errors if it fails
    local ok = os.execute(cmd .. ' > /dev/null 2>&1')
    if ok == 0 then
      vim.cmd 'edit' -- reload the file if formatting succeeded
    end
  end,
})

-- actually go to definition
vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', { desc = 'Fuzzy go-to-definition' })
