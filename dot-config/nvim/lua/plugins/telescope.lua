return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>ff",       "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg",       "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    { "<leader>fb",       "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    { "<leader>fh",       "<cmd>Telescope help_tags<cr>",  desc = "Help tags" },
  },
  opts = {},
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
}
