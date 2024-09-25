return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
      })
    end,
    -- opts = { shell = 'nu' },
    keys = {
      { "<leader>wt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open terminal" },
    },
  },
  { "mbbill/undotree" },
}
