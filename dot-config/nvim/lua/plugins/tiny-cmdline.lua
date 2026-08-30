return {
  "rachartier/tiny-cmdline.nvim",
  config = function()
    vim.o.cmdheight = 0
    require("tiny-cmdline").setup({
      on_reposition = require("tiny-cmdline").adapters.blink,
      position = {
        x = "50%",
        y = "10%",
      },
    })
  end,
}
