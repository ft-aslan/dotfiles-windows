return {
  'folke/tokyonight.nvim',
  'sainnhe/gruvbox-material',
  {
    'neanias/everforest-nvim',
    config = function()
      require('everforest').setup {
        background = 'hard',
      }
    end,
  },
  {
    -- colorscheme picker
    'vague2k/huez.nvim',
    -- if you want registry related features, uncomment this
    import = 'huez-manager.import',
    branch = 'stable',
    event = 'UIEnter',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    keys = {
      {
        '<leader>utp',
        '<cmd>Huez<CR>',
        desc = 'Toggle colorscheme picker',
      },
      {
        '<leader>utp',
        '<cmd>HuezLive<CR>',
        desc = 'Live colorscheme picker',
      },
    },
    config = function()
      require('huez').setup {}
    end,
  },
}
