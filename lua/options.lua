local opt = vim.o

opt.guicursor = "i:block"
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.number = true
opt.wrap = false
opt.relativenumber = true
opt.numberwidth = 2
-- opt.cursorline = true
opt.scrolloff = 8
opt.inccommand = "nosplit"
opt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
opt.undofile = true
vim.o.hlsearch = false
vim.diagnostic.config({ signs = false })
vim.diagnostic.config({ underline = false })
opt.winborder = "rounded"
opt.showmode = false

vim.cmd.filetype("plugin indent on")
