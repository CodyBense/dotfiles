vim.g.mapleader = " "

local keymap = vim.keymap

-- goes to tree explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- allows moving selected lines and autoindent
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- add next line at end and keeps cursor in current position
keymap.set("n", "J", "mzJ`z")

-- half page jumps and keeps cursor in middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps cursor in place when searching terms
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- copys over and  puts replace in the void register
keymap.set("x", "<leader>p", "\"_dP")

-- copys to computer clipboard
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

--deletes to void register
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- Q is a bad place?
keymap.set("n", "Q", "<nop>")

