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

-- autocmd("BufEnter", {
-- 	pattern = { "*.", ".*", "*.*" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 	end,
-- 	group = bufEnter,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
  end,
})

autocmd("BufEnter", {
    pattern = {"*.c", "*.cpp"},
    callback = function ()
        vim.cmd("set makeprg=./build.sh")
    end,
})

-- Format buffer on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		vim.lsp.buf.format()
-- 	end,
-- })
