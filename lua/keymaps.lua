local s = { silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<CMD>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- vim.keymap.set("n", "<c-j>", "<c-w>j")
-- vim.keymap.set("n", "<c-k>", "<c-w>k")
-- vim.keymap.set("n", "<c-l>", "<c-w>l")
-- vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, s)
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
vim.keymap.set("n", "<leader>x", "<cmd>.lua<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>restart<cr>")
vim.keymap.set("t", "<Esc><esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>t", "<cmd>term<cr>")
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")
vim.keymap.set({ "n", "i", "v" }, "<C-[>", "<Esc>")
vim.keymap.set("n", "gca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "<leader>rr", "<cmd>make<cr>")
vim.keymap.set('n', 'q;', 'q:')
vim.keymap.set('n', '<leader>rf', function ()
    vim.ui.input({ prompt = 'run file: ' }, function (input)
        if input == nil then
            return 0
        end
        vim.cmd('!./' .. input)
    end)
end)
vim.keymap.set("n", "<leader>rs", function()
	vim.ui.input({ prompt = "makeprg: " }, function(input)
        if input == nil then
        end
		vim.cmd("set makeprg=" .. input)
	end)
end)

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>")
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<leader>dd", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>dq", "<cmd>Trouble qflist toggle <cr>")
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set("n", "<leader>;", "q:")
vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<cr>")
vim.keymap.set("n", "ya", "<cmd>%y<cr>")
vim.keymap.set("n", "da", "<cmd>%d<cr>")
vim.keymap.set('n', '<leader>gg', '<cmd>lua Snacks.lazygit()<cr>')
