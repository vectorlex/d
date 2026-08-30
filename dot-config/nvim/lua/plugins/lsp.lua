return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    },
    event = 'LspAttach',
    keys = {
      -- 常用功能
      { "<leader>r", "<cmd>Lspsaga rename<CR>", desc = "重命名" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "代码操作" },
      { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "行内诊断" },
      { "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "预览定义" },
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "查找引用/实现" },
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "悬停文档" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "上一个诊断" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "下一个诊断" },
      -- 可选：大纲
      { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "大纲" },
    },

    opts = {},
    config = function(_, opts)
      vim.api.nvim_set_hl(0, 'WinBar', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'WinBarNC', { bg = 'NONE' })
      require('lspsaga').setup(opts)
    end,
  },
}
