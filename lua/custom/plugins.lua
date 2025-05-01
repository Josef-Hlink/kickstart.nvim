-- lua/custom/plugins.lua
---@diagnostic disable: missing-fields

return {
  -- vim-be-good
  {
    'ThePrimeagen/vim-be-good',
    cmd = 'VimBeGood',
  },
  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end,
  },
  -- vim-visual-multi
  {
    'mg979/vim-visual-multi',
    -- init = function()
    --   vim.g.VM_default_mappings = 1
    --   vim.g.VM_maps = {
    --     ['Find Under'] = '<C-d>',
    --     ['Find Subword Under'] = '<C-d>',
    --     ['Add Cursor Down'] = '<C-Down',
    --     ['Add Cursor Up'] = 'C-Up',
    --   }
    -- end,
  },
}
