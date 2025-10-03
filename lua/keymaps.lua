local s = { silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<CMD>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, s)
vim.keymap.set("n", "<leadercd", vim.fn.chdir(vim.fn.expand("%:p:h")), s)

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>")
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<cr>")
