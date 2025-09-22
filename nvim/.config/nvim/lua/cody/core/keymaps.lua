vim.g.mapleader = " "

local keymap = vim.keymap

-- goes to tree explorer
-- keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

-- allows moving of selected lines and autoindent
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- add next line at end and keeps cursor in current position
keymap.set("n", "J", "mzJ`z")

-- half page jumps and keeys cursor in middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps cursor in place when searching terms
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- copys over and puts replace in void register
keymap.set("x", "<leader>p", "\"_dP")

-- copys to computer clipboard
keymap.set({ "n", "v" }, "<leader>y", "\"+y")

-- deletes to void register
keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Q is a bad place?
keymap.set("n", "Q", "<nop>")

keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

keymap.set("n", "<leader>lf", vim.lsp.buf.format)

keymap.set("n", "<leader>f", ":Pick files<CR>")
keymap.set("n", "<leader>gf", ":Pick files tool='git'<CR>")
keymap.set("n", "<leader>h", ":Pick help<CR>")
