require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD Enter command mode" })
map("i", "jk", "<ESC>", { desc = "General Exit insert mode" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR>", { desc = "CMD Write buffer" })

-- delete single character without copying into register
map("n", "x", '"_x')

-- close all buffers except the current one
map("n", "<C-x>", "<cmd> %bd|e# <CR>", { desc = "CMD Close all other buffers" })

map("n", "-", "za", { desc = "General Toggle fold under cursor" })

map("n", "<leader>fr", "<cmd> Telescope resume <CR>", { desc = "Telescope Resume search" })
