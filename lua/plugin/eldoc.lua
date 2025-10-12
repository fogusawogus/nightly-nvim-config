vim.pack.add({
    { src = 'https://codeberg.org/sj2tpgk/nvim-eldoc' }
})

require('nvim-eldoc').setup()
vim.cmd([[
set updatetime=700           " Show signature after 700ms cursor idle
hi link Eldoc    Normal      " Highlight for eldoc
hi link EldocCur Identifier  " Highlight for currently focused parameter
]])
