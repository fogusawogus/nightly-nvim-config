vim.o.complete = '.,o,w,b,u,t,i,d'
vim.o.completeopt = 'fuzzy,menuone,noinsert'
vim.o.pumheight = 7

-- vim.api.nvim_create_augroup("my-luasnip", {})
-- vim.api.nvim_create_autocmd('CompleteDone', {
-- 	group = "my-luasnip",
-- 	desc = "Expand LSP snippet",
-- 	pattern = "*",
-- 	callback = function(opts)
-- 		local comp = vim.v.completed_item
--
-- 		-- check that this is an lsp completion
-- 		if not vim.tbl_get(comp, 'user_data', 'nvim', 'lsp') then return end
--
-- 		-- check that we were given a snippet
-- 		local complete_info = comp.user_data.nvim.lsp.completion_item
-- 		if not complete_info.insertTextFormat or complete_info.insertTextFormat == 1 then return end
--
-- 		-- remove the inserted text
-- 		local start_col = complete_info.textEdit.range.start.character+1
-- 		vim.fn.cursor(vim.fn.line('.'), start_col)
-- 		vim.cmd.normal{args = {"d" .. #comp.word .. "l"}}
--
-- 		-- if the inserted text was the last text on the line, the deletion command will leave the cursor 1 column left
-- 		-- of where we need to insert the snippet (because insert mode can put the cursor 1 position ahead of the last column)
-- 		-- move the cursor back over 1
-- 		vim.fn.cursor(vim.fn.line('.'), start_col)
--
-- 		-- insert snippet
-- 		local snip_text = vim.tbl_get(complete_info, 'textEdit', 'newText') or comp.insertText
-- 		assert(snip_text, "Language server indicated it had a snippet, but no snippet text could be found!")
-- 		require('luasnip').lsp_expand(snip_text)
-- 	end
-- })
