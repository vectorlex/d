return {
  "ankushbhagats/match.nvim",
  lazy = true,
  cmd = { "Match", "MatchWord", "MatchLine" },
  opts = {},
  keys = {
    { "/", "<cmd>Match<cr>", desc = "搜索与替换" },
  },
}
