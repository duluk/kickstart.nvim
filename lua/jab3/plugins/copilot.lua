local hostname = vim.fn.hostname()

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Set the color used for Copilot suggestions, no matter the color scheme',
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
      -- fg = '#555555', -- darker gray (too dark)
      fg = '#ADD8E6', -- light blue
      -- fg = '#6C757D', -- lighter gray
      ctermfg = 8,
      force = true,
    })
  end,
})

vim.api.nvim_create_user_command('CopilotToggle', function()
  vim.cmd('Copilot ' .. (vim.g.copilot_enabled == 0 and 'enable' or 'disable'))
end, {})

return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = 1
      vim.g.copilot_workspace_folders = { '~/src/mine' }
    end,
  },
}
