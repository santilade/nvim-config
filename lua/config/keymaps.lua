-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ft", function()
  vim.cmd("vsplit | terminal")
end, { desc = "Terminal (vertical split)" })

vim.keymap.set("n", "<leader>fT", function()
  vim.cmd("terminal")
end, { desc = "Terminal (current pane)" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
