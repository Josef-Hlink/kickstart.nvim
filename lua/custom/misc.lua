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

-- browser for markdown previes
vim.g.mkdp_browser = 'firefox'

-- harpoon setup
local harpoon = require 'harpoon'
harpoon:setup {}

-- keymaps for harpoon
vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Add file to harpoon' })

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end)

-- use telescope for harpoon
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

vim.keymap.set('n', '<leader>e', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })

vim.keymap.set('n', '<leader>r', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Toggle harpoon quick menu' })

-- open telescope on startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Only trigger if no files were passed to nvim
    if vim.fn.argc() ~= 0 then
      return
    end
    local harpoon_list = harpoon:list()
    if #harpoon_list.items > 0 then
      toggle_telescope(harpoon_list)
    else
      vim.cmd 'Telescope find_files'
    end
  end,
})
