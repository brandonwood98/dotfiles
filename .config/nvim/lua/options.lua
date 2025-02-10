require "nvchad.options"

local o = vim.o

o.relativenumber = true -- turn relative line numbers on by default

-- Ensure Copilot doesn't make suggestions
vim.g.copilot_enabled = 0

