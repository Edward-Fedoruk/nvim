vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set clipboard=unnamed")

vim.opt.scrolloff = 15
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>ex', vim.cmd.Ex)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<Leader>s', ':w<CR>')
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ln', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { noremap = true, silent = true, desc = "Toggle Relative Numbers" })
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.keymap.set('n', '<Leader>/', ':nohlsearch<CR>', {})
-- Move lines up
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
