return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config

  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },

  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local highlight_dark = {
      "RainbowRedDark",
      "RainbowYellowDark",
      "RainbowBlueDark",
      "RainbowOrangeDark",
      "RainbowGreenDark",
      "RainbowVioletDark",
      "RainbowCyanDark",
    }

    local hooks = require "ibl.hooks"

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF757F" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFC777" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#82AAFF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF966C" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#C3E88D" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C099FF" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#86E1FC" })

      vim.api.nvim_set_hl(0, "RainbowRedDark", { fg = "#99464C" })
      vim.api.nvim_set_hl(0, "RainbowYellowDark", { fg = "#997747" })
      vim.api.nvim_set_hl(0, "RainbowBlueDark", { fg = "#4E6699" })
      vim.api.nvim_set_hl(0, "RainbowOrangeDark", { fg = "#995A41" })
      vim.api.nvim_set_hl(0, "RainbowGreenDark", { fg = "#758B55" })
      vim.api.nvim_set_hl(0, "RainbowVioletDark", { fg = "#735C99" })
      vim.api.nvim_set_hl(0, "RainbowCyanDark", { fg = "#508797" })
    end)

    vim.g.rainbow_delimiters = vim.tbl_deep_extend("force", vim.g.rainbow_delimiters or {}, {
      highlight = highlight,
    })

    require("ibl").setup {
      indent = { highlight = highlight_dark },
      scope = { highlight = highlight },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
