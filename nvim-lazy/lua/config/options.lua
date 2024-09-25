-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
  vim.g.neovide_no_custom_clipboard = false
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.g.neovide_cursor_animate_in_insert_mode = false
  local default_path = vim.fn.expand("~")
  vim.api.nvim_set_current_dir(default_path)
else
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end
-- Set Language to English
vim.api.nvim_exec2(
  [[
  set langmenu=en_US.UTF-8
  set spelllang=en_us
]],
  {
    output = false,
  }
)
if os.getenv("OS") == "Windows_NT" then
  vim.opt.undodir = os.getenv("USERPROFILE") .. "\\.vim\\undodir"
else
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"
