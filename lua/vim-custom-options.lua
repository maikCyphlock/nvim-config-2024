vim.cmd("set expandtab")
vim.cmd("set relativenumber")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.keymap.set("n", "<C-q>", ":q<CR>")

vim.keymap.set("n", "<C-s>", ":w<CR>")

vim.keymap.set("n","<leader>n", ":bnext<CR>")

vim.keymap.set("n", "<leader>b", ":bprevious<CR>")
