vim.pack.add({
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/benomahony/oil-git.nvim' }
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
    win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
    },
})

require('oil-git').setup()

