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
vim.keymap.set('n', '<leader>ct', '<Cmd>CopilotToggle<CR>', { noremap = true, silent = true })

return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = 1
      vim.g.copilot_workspace_folders = { '~/src/mine' }
      -- vim.g.copilot_no_tab_map = 1
      -- vim.g.copilot_no_insert_completion = 1
    end,
  },
}

-- The completion for this is weird and doesn't work right...for me
-- return {
--   'zbirenbaum/copilot.lua',
--   cmd = 'Copilot',
--   event = 'InsertEnter',
--   config = function()
--     require('copilot').setup {
--       -- Node.js version must be 16.x or higher
--       copilot_node_command = 'node',
--       -- Turn these off when using copilot_cmp:
--       suggestion = { enabled = false },
--       panel = { enabled = false },
--       -- enabled = true,
--       -- workspace_folders = { '~/src/mine' },
--     }
--   end,
-- }
