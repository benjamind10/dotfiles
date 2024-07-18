-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("custom.autosave")
require("config.lsp")
require("config.jdtls")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = false
  end,
})
