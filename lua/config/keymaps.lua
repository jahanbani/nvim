-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Save key strokes (now we do not need to press shift to enter command mode).
vim.keymap.set({ "n", "x" }, ";", ":")
