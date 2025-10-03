vim.pack.add({
    { src = 'https://github.com/stevearc/oil.nvim' }
})

require('oil').setup({
    columns = {
        'icon',
        'permissions',
        'size',
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>')
