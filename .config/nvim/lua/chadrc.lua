-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "decay",
  transparency = true,
  changed_themes = {
    decay = {
      base_30 = {
        folder_bg = "#60FCCB",
        blue = "#60FCCB",
      },
    },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

M.cheatsheet = {
  theme = "simple", -- simple/grid
  -- excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}

M.nvdash = {
  load_on_startup = true,
}

return M
