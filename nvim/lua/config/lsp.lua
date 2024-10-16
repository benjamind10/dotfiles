-- ~/.config/nvim/lua/config/lsp.lua

-- Ensure mason and mason-lspconfig are set up
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
})

-- Set up LSP config
local lspconfig = require("lspconfig")

-- Enable pyright for Python
--lspconfig.pyright.setup({
--capabilities = require("cmp_nvim_lsp").default_capabilities(),
--settings = {
--python = {
--analysis = {
--autoSearchPaths = true,
--useLibraryCodeForTypes = true,
--diagnosticMode = "workspace",
--},
--},
--},
--root_dir = function(fname)
--return lspconfig.util.find_git_ancestor(fname) or vim.loop.cwd()
--end,
--})
