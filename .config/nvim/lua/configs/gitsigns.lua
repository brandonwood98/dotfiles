local opts = {
  current_line_blame = true,

  on_attach = function()
    local gs = package.loaded.gitsigns
    local map = vim.keymap.set

    -- Gitsigns
    map("n", "]h", gs.next_hunk, { desc = "Gitsigns Next Hunk" })
    map("n", "[h", gs.prev_hunk, { desc = "Gitsigns Prev Hunk" })

    map("n", "<leader>gp", gs.preview_hunk, { desc = "Gitsigns Preview hunk" })

    map("n", "<leader>gb", function()
      gs.blame_line { full = true }
    end, { desc = "Gitsigns Blame line" })
    map("n", "<leader>gB", gs.toggle_current_line_blame, { desc = "Gitsigns Toggle line blame" })

    map("n", "<leader>gd", gs.diffthis, { desc = "Gitsigns Diff this" })
    map("n", "<leader>gD", function()
      gs.diffthis "~"
    end, { desc = "Gitsigns Diff this ~" })
  end,
}

return opts
