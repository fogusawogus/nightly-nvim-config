local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local highlight_group = augroup("YankHighlight", { clear = true })
local bufEnter = augroup("BufEnter", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
})

autocmd("BufEnter", {
	pattern = {"*.", ".*", "*.*"},
	callback = function()
		vim.treesitter.start()
	end,
	group = bufEnter,
})
