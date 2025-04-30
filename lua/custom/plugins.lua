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
}
