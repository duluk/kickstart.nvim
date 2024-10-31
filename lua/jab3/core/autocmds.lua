-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Set the background color to black no matter the color scheme',
  pattern = '*',
  callback = function()
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#010101' })
  end,
})

-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
-- From github.com/creativenull/dotfiles; modified for 0.11
vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('MyAutocmdGroup', { clear = true }),
  callback = function(args)
    local valid_line = vim.fn.line [['"]] >= 1 and vim.fn.line [['"]] < vim.fn.line '$'
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd [[normal! g`"]]
    end
  end,
})
