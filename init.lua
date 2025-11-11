require("statusline")
require("themes")
vim.g.mapleader = " "

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	-- 	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/benomahony/oil-git.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- { src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://codeberg.org/sj2tpgk/nvim-eldoc" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})
require("mason").setup()
require("mason-lspconfig").setup()
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
})
local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
require("luasnip.loaders.from_vscode").lazy_load()
-- require("blink.cmp").setup({
-- 	cmdline = { enabled = false },
-- 	fuzzy = { implementation = "rust" },
--
-- 	keymap = {
-- 		preset = "default",
-- 		["<C-l>"] = { "snippet_forward", "fallback" },
-- 		["<C-h>"] = { "snippet_backward", "fallback" },
--         ["<C-o>"] = {function(cmp) cmp.show() end}
-- 	},
--     snippets = {
--         preset = 'luasnip'
--     },
--
-- 	appearance = {
-- 		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
-- 		-- Adjusts spacing to ensure icons are aligned
-- 		nerd_font_variant = "mono",
-- 	},
-- 	signature = {
-- 		enabled = false,
-- 		window = {
-- 			show_documentation = false,
-- 		},
-- 	},
--
-- 	completion = {
-- 		-- By default, you may press `<c-space>` to show the documentation.
-- 		-- Optionally, set `auto_show = true` to show the documentation after a delay.
-- 		documentation = { auto_show = false, auto_show_delay_ms = 500, window = { border = "rounded" } },
-- 		menu = {
-- 			auto_show = false,
-- 			border = "none",
-- 		},
-- 		ghost_text = {
-- 			enabled = true,
-- 		},
--
-- 		list = {
-- 			selection = {
-- 				preselect = true,
-- 				auto_insert = false,
-- 			},
-- 		},
-- 	},
-- })
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.pick").setup()
-- require("mini.indentscope").setup({
-- 	draw = {
-- 		animation = require("mini.indentscope").gen_animation.none(),
-- 		delay = 0,
-- 	},
-- 	symbol = "|",
-- })

require("mini.icons").setup({
	style = "ascii",
})
require("mini.extra").setup()
-- require('mini.sessions').setup()
-- require("mini.starter").setup()
require("mini.misc").setup()

local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

function _G.get_oil_winbar()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

require("oil").setup({
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
	skip_confirm_for_simple_edits = false,
	view_options = {
		show_hidden = true,
	},
	win_options = {
		winbar = "%!v:lua.get_oil_winbar()",
	},
})

require("oil-git").setup()
require("gitsigns").setup({})
-- require("trouble").setup({
-- 	auto_close = true,
-- 	focus = true,
-- })
require("nvim-autopairs").setup({
	map_c_w = true,
})

require("snacks").setup({
	lazygit = { enabled = true },
})
require("nvim-eldoc").setup()
vim.cmd([[
set updatetime=700           " Show signature after 700ms cursor idle
hi link Eldoc    Normal      " Highlight for eldoc
hi link EldocCur Identifier  " Highlight for currently focused parameter
]])
require("fidget").setup()
require("typst-preview").setup({})

local opt = vim.o
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- OPTIONS

vim.cmd("set shortmess+=I")
opt.guicursor = "i:block"
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.number = true
opt.wrap = false
opt.relativenumber = true
opt.numberwidth = 2
opt.smartindent = true
-- opt.cursorline = true
opt.scrolloff = 8
opt.inccommand = "nosplit"
opt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
opt.undofile = true
vim.o.hlsearch = false
vim.diagnostic.config({ signs = false })
vim.diagnostic.config({ underline = false })
opt.winborder = "rounded"
-- opt.showmode = false
opt.laststatus = 3
opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "·", lead = "·" }

vim.cmd.filetype("plugin indent on")
vim.o.background = "dark"

-- AUTOCOMMANDS

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
    pattern = ("*.typ"),
    callback = function()
        vim.cmd("set wrap")
    end
})

-- autocmd("BufEnter", {
-- 	pattern = { "*.", ".*", "*.*" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 	end,
-- 	group = bufEnter,
-- })

-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	callback = function(args)
-- 		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
-- 		local line_count = vim.api.nvim_buf_line_count(args.buf)
-- 		if mark[1] > 0 and mark[1] <= line_count then
-- 			vim.cmd('normal! g`"zz')
-- 		end
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'TextChanged', 'TextChangedI' }, {
--     callback = function()
--         vim.cmd('w')
--     end
-- })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
	end,
})

autocmd("BufEnter", {
	pattern = { "*.c", "*.cpp" },
	callback = function()
		vim.cmd("set makeprg=./build.sh")
	end,
})

autocmd("BufEnter", {
	pattern = { "*.go", "*.mod" },
	callback = function()
		vim.cmd("set makeprg=go")
	end,
})

-- Format buffer on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		vim.lsp.buf.format()
-- 	end,
-- })

-- KEYMAPS

local s = { silent = true }


vim.keymap.set("n", "<leader>w", "<CMD>w<cr>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- vim.keymap.set("n", "<c-j>", "<c-w>j")
-- vim.keymap.set("n", "<c-k>", "<c-w>k")
-- vim.keymap.set("n", "<c-l>", "<c-w>l")
-- vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Oil" })
vim.keymap.set("n", "<leader>x", "<cmd>.lua<cr>", { desc = "Execute lua" })
vim.keymap.set("n", "<leader>o", "<cmd>restart<cr>", { desc = "Restart" })
vim.keymap.set("t", "<Esc><esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>t", "<cmd>term<cr>", { desc = "terminal" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
vim.keymap.set({ "n", "i", "v" }, "<C-[>", "<Esc>")
vim.keymap.set("n", "gca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "<leader>rr", "<cmd>make<cr>", { desc = "Make" })
vim.keymap.set("n", "q;", "q:")
vim.keymap.set("n", "<leader>rf", function()
	vim.ui.input({ prompt = "run file: " }, function(input)
		if input == nil then
			return 0
		end
		vim.cmd("!./" .. input)
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
vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<cr>", { desc = "Pick files" })
vim.keymap.set("n", "<leader>sg", "<cmd>Pick grep_live<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<cr>", { desc = "Pick buffers" })
-- vim.keymap.set("n", "<leader>dd", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
-- vim.keymap.set("n", "<leader>dq", "<cmd>Trouble qflist toggle <cr>", { desc = "Quickfix list" })
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set("n", "<leader>;", "q:", { desc = "Command window" })
vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<cr>", { desc = "Search help" })
vim.keymap.set("n", "ya", "<cmd>%y<cr>")
vim.keymap.set("n", "da", "<cmd>%d<cr>")
vim.keymap.set("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", { desc = "lazygit" })
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Quickfix open" })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Quickfix close" })
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Quickfix next" })
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "Quickfix previous" })

-- NEOVIDE

if vim.g.neovide then
	vim.o.guifont = "Personal Iosevka:h16"
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_position_animation_length = 0

	vim.g.neovide_window_blurred = false
    vim.keymap.set('n', '<leader>q', "<cmd>bd<cr>")
end

-- COMPLETION

vim.o.complete = ".,o,w,b,u,t,i,d"
vim.o.completeopt = "fuzzy,menuone,noinsert"
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
