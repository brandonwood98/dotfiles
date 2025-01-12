return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    local auto_session = require "auto-session"

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    }

    local keymap = vim.keymap

    keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "SESSION Restore session for cwd" })
    keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "SESSION Save session for auto session root dir" })
  end,
}
