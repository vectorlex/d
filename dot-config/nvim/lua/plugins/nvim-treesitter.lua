return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
    lazy = false,
    build = ':TSUpdate',
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      mode = "topline",
      max_lines = 13,
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)
      vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = "NONE" })
    end,
  },
}
