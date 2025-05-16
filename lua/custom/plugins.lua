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
  -- context
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPost',
    config = function()
      require('treesitter-context').setup {
        enable = true,
        max_lines = 3, -- how many context lines to show
        trim_scope = 'outer', -- can be "inner", "outer"
        mode = 'cursor', -- or "topline"
      }
    end,
  },
  -- colorizer
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
      require('colorizer').setup {
        '*', -- enable for all filetypes by default
      }
    end,
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end,
  },
}
