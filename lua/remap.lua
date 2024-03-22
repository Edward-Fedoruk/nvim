vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set clipboard=unnamed")

vim.opt.scrolloff = 15
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.g.mapleader = ' '
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.keymap.set('n', '<leader>ex', vim.cmd.Ex)
vim.keymap.set('n', '<leader>ln', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { noremap = true, silent = true, desc = "Toggle Relative Numbers" })
vim.keymap.set('n', '<Leader>/', ':nohlsearch<CR>', {})
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<Leader>s', ':w<CR>')
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
-- Move lines up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
