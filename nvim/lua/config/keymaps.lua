-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>p", ":Prettier<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pa", ":PrettierAsync<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })

-- NERDCommenter Mappings
vim.api.nvim_set_keymap("n", "<leader>00", "<Plug>NERDCommenterToggle", {})
vim.api.nvim_set_keymap("v", "<leader>00", "<Plug>NERDCommenterToggle", {})
vim.api.nvim_set_keymap("n", "<leader>c<space>", "<Plug>NERDCommenterToggle", {})
vim.api.nvim_set_keymap("v", "<leader>c<space>", "<Plug>NERDCommenterToggle", {})

vim.api.nvim_set_keymap("n", "<leader><Tab>[", ":bprevious<CR>", {})
vim.api.nvim_set_keymap("n", "<leader><Tab>]", ":bnext<CR>", {})
