-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("custom.autosave")
require("config.lsp")
--require("config.jdtls")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = false
  end,
})

--vim.diagnostic.config({
--virtual_text = false,
--signs = false,
--update_in_insert = false,
--severity_sort = false,
--float = {
--source = "always",
--border = "rounded",
--format = function(diagnostic)
--return string.format("%s: %s", diagnostic.source, diagnostic.message)
--end,
--},
--})
