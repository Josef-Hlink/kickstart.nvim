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
  -- copilot
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
            next = '<C-n>',
            prev = '<C-p>',
            dismiss = '<C-h>',
          },
        },
      }
    end,
  },
}
