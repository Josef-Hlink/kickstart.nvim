-- lua/custom/plugins.lua

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
      require('Comment').setup {
        padding = true,
        sticky = true,
      }
    end,
  },
}
