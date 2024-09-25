return {

  -- measure startuptime
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    enabled = false,
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  -- library used by other plugins
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  {
    'windwp/nvim-ts-autotag',

    opts = {},
  },
  {
    'gbprod/yanky.nvim',
    dependencies = not jit.os:find 'Windows' and { 'kkharji/sqlite.lua' } or {},
    opts = {
      highlight = { timer = 250 },
      ring = { storage = jit.os:find 'Windows' and 'shada' or 'sqlite' },
    },
    keys = {
      -- stylua: ignore
    { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
      { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
      { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
      { '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle forward through yank history' },
      { ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle backward through yank history' },
      { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
      { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
      { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
      { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
      { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
    },
  },
  { 'kkharji/sqlite.lua' },
  {
    'jackMort/ChatGPT.nvim',
    enabled = false,
    event = 'BufReadPre',
    config = function()
      local api_key
      if os.getenv 'OS' == 'Windows_NT' then
        api_key = os.getenv 'USERPROFILE' .. '\\.chatgpt_api_key.txt'
      else
        api_key = os.getenv 'HOME' .. '/.chatgpt_api_key.txt'
      end
      require('chatgpt').setup {
        api_key_cmd = 'cat ' .. api_key,
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'Exafunction/codeium.vim',
    enabled = true,
    event = 'BufEnter',
  },
  -- this nvim plugin just adds the suggestions to cmp
  -- {
  --   'Exafunction/codeium.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'hrsh7th/nvim-cmp',
  --   },
  --   config = function()
  --     require('codeium').setup {}
  --   end,
  -- },
  --
  -- {
  --   'soulis-1256/eagle.nvim',
  --   config = function()
  --     require('eagle').setup {}
  --   end,
  -- },
  {
    'lewis6991/hover.nvim',
    config = function()
      require('hover').setup {
        init = function()
          -- Require providers
          require 'hover.providers.lsp'
          require 'hover.providers.gh'
          require 'hover.providers.gh_user'
          require 'hover.providers.dap'
          require 'hover.providers.diagnostic'
          require 'hover.providers.dictionary'
        end,
        preview_opts = {
          border = 'single',
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP',
        },
        mouse_delay = 1000,
      }

      -- Setup keymaps
      vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
      vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
      vim.keymap.set('n', '<C-p>', function()
        require('hover').hover_switch 'previous'
      end, { desc = 'hover.nvim (previous source)' })
      vim.keymap.set('n', '<C-n>', function()
        require('hover').hover_switch 'next'
      end, { desc = 'hover.nvim (next source)' })

      -- Mouse support
      vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = 'hover.nvim (mouse)' })
      vim.o.mousemoveevent = true
    end,
  },
  {
    {
      'rmagatti/auto-session',
      dependencies = {
        'nvim-telescope/telescope.nvim',
      },
      config = function()
        require('auto-session').setup {
          log_level = 'error',
          auto_session_suppress_dirs = { '~/', '~/projects', '/mnt/c/Windows/System32' },

          -- ⚠️ This will only work if Telescope.nvim is installed
          -- The following are already the default values, no need to provide them if these are already the settings you want.
          session_lens = {
            -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
            load_on_setup = true,
            theme_conf = { border = true },
            previewer = false,
            buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
          },
        }
        vim.keymap.set('n', '<leader>fp', require('auto-session.session-lens').search_session, {
          noremap = true,
        })
      end,
    },
  },
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require('dbee').install()
    end,
    config = function()
      require('dbee').setup(--[[optional config]])
      vim.keymap.set('n', '<leader>wd', require('dbee').toggle, { desc = 'Dbee' })
    end,
  },
  {
    'pwntester/octo.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
      vim.keymap.set('n', '<leader>gi', '<cmd>Octo issue list<cr>', { desc = 'Octo Issue List' })
    end,
  },
}
