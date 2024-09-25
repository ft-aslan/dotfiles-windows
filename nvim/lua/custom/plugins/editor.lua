local trouble_colors = {
  error = '#ff0000', -- Red color for errors
  warning = '#ff8800', -- Orange color for warnings
  info = '#00ffff', -- Cyan color for info messages
  hint = '#ffff00', -- Yellow color for hints
}
return {
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      -- signs = {
      --   -- icons / text used for a diagnostic
      --   error = ' ',
      --   warning = ' ',
      --   hint = ' ',
      --   information = ' ',
      --   other = '',
      -- },

      use_diagnostic_signs = true,
    },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Document Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next trouble/quickfix item',
      },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').prev { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-t>]],
      }
    end,
    -- opts = { shell = 'nu' },
    keys = {
      { '<leader>wt', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Open terminal' },
    },
  },
  { 'mbbill/undotree' },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'nvim-pack/nvim-spectre',
    config = function()
      require('spectre').setup()

      vim.keymap.set('n', '<leader>sr', require('spectre').open, { desc = 'Open Spectre' })
      -- vim.keymap.set('n', '<leader>sw', require('spectre').open_visual, { desc = 'Search current word' })
      -- vim.keymap.set('v', '<leader>sw', require('spectre').open_visual, { desc = 'Search current word' })
      vim.keymap.set('n', '<leader>s/', require('spectre').open_file_search, { desc = 'Search current file' })
    end,
  },
}
