----------------------------------
---IF ITS NOT RUNNING ON VSCODE---
----------------------------------
if vim.g.vscode then
  -- VSCode extension

  -- vim.keymap.set('n', '<leader>fn', 'mciw*<Cmd>nohl<CR>', { remap = true })

  -- remove unsupported keybinds
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.opt.clipboard = 'unnamedplus'
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  vim.keymap.set("n", "<C-d>", "<C-d>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-u>", "<C-u>", { noremap = true, silent = true })

  vim.keymap.set("n", "n", "n", { noremap = true, silent = true })
  vim.keymap.set("n", "N", "N", { noremap = true, silent = true })

  vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
  -- Map L to $ and H to ^ in all modes
  vim.keymap.set("n", "L", "$", { noremap = true, silent = true })
  vim.keymap.set("x", "L", "$", { noremap = true, silent = true })
  vim.keymap.set("n", "H", "^", { noremap = true, silent = true })
  vim.keymap.set("x", "H", "^", { noremap = true, silent = true })

  local vscode = require("vscode-neovim")

  vim.keymap.set("n", "<leader><leader>", function()
    vscode.action("workbench.action.quickOpen")
  end)
  vim.keymap.set("n", "<leader>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)
  vim.keymap.set("n", "<leader>t", function()
    vscode.action("workbench.action.terminal.focusNext")
  end)
  vim.keymap.set("n", "<leader>p", function()
    vscode.action("workbench.action.showCommands")
  end)
  vim.keymap.set("n", "<leader>gg", function()
    vscode.action("workbench.view.scm")
  end)

  vim.keymap.set("n", "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end)
  vim.keymap.set("n", "<leader>ss", function()
    vscode.action("workbench.document.symbols")
  end)
  vim.keymap.set("n", "<leader>sS", function()
    vscode.action("workbench.action.showAllSymbols")
  end)
  vim.keymap.set("n", "<leader>sd", function()
    vscode.action("workbench.actions.view.problems")
  end)
  vim.keymap.set("n", "<leader>sg", function()
    vscode.action("workbench.action.quickTextSearch")
  end)

  vim.keymap.set("n", "<leader>df", function()
    vscode.action("editor.action.format")
  end)
  vim.keymap.set("n", "<leader>ds", function()
    vscode.action("workbench.action.gotoSymbol")
  end)
  vim.keymap.set("n", "<leader>dw", function()
    vscode.action("workbench.action.files.save")
  end)

  vim.keymap.set("n", "<leader>bd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end)
  vim.keymap.set("n", "<leader>bo", function()
    vscode.action("workbench.action.closeOtherEditors")
  end)
  vim.keymap.set("n", "[b", function()
    vscode.action("workbench.action.previousEditor")
  end)
  vim.keymap.set("n", "]b", function()
    vscode.action("workbench.action.nextEditor")
  end)

  vim.keymap.set("n", "[g", function()
    vscode.action("workbench.action.navigateBack")
  end)
  vim.keymap.set("n", "]g", function()
    vscode.action("workbench.action.navigateForward")
  end)

  vim.keymap.set("n", "gr", function()
    vscode.action("editor.action.goToReferences")
  end)

  vim.keymap.set("n", "<leader>ca", function()
    vscode.action("editor.action.quickFix")
  end)
  vim.keymap.set("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end)
  vim.keymap.set({ "n", "x", "i" }, "<C-n>", function()
    vscode.with_insert(function()
      vscode.action("editor.action.addSelectionToNextFindMatch")
    end)
  end)
  vim.keymap.set("n", "gn", "mciw*<Cmd>nohl<CR>", { remap = true })

  -- [[ Install `lazy.nvim` plugin manager ]]
  --    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  end ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup({
    {
      "vscode-neovim/vscode-multi-cursor.nvim",
      event = "VeryLazy",
      opts = {},
    },
  })
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
