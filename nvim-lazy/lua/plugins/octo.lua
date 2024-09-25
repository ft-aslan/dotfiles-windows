return {
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
      vim.keymap.set("n", "<leader>gi", "<cmd>Octo issue list<cr>", { desc = "Octo Issue List" })
    end,
  },
}
