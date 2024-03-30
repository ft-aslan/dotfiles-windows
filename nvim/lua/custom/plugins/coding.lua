return {
  {
    'mg979/vim-visual-multi',

    version = '*',
    -- opts = {}
  },
  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    opts = {},
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
