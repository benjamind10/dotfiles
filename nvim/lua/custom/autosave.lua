-- ~/.config/nvim/lua/custom/autosave.lua

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
