vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>l", vim.cmd.tabnext)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true, silent = true})

-- Remap <leader>n to follow a tag (jump to definition)
vim.api.nvim_set_keymap('n', '<leader>n', '<C-]>', { noremap = true, silent = true })

