vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
	lazygit = { enabled = true },
	indent = { enabled = true },
})
