return {
  "ankushbhagats/match.nvim",
  lazy = true,
  cmd = { "Match", "MatchWord", "MatchLine" },
  opts = {},
  keys = {
    { "<leader>/", "<cmd>Match<cr>", desc = "搜索与替换" },
  },
}
