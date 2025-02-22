-- Github Copilot commented out at bottom

vim.api.nvim_create_user_command('CopilotToggle', function()
  vim.cmd('Copilot ' .. (vim.g.copilot_enabled == 0 and 'enable' or 'disable'))
end, {})
vim.keymap.set('n', '<leader>ct', '<Cmd>CopilotToggle<CR>', { noremap = true, silent = true })

return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        -- Node.js version must be 16.x or higher
        copilot_node_command = 'node',
        -- Turn these off when using copilot_cmp:
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          bash = true,
          c = true,
          cpp = true,
          go = true,
          javascript = true,
          json = true,
          lua = true,
          markdown = true,
          python = true,
          ruby = true,
          rust = true,
          sh = true,
          toml = true,
          typescript = true,
          vim = true,
          yaml = true,
          zig = true,
          zsh = true,
          ['.'] = false,
        },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    after = 'copilot.lua',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   desc = 'Set the color used for Copilot suggestions, no matter the color scheme',
--   pattern = '*',
--   callback = function()
--     vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
--       -- fg = '#555555', -- darker gray (too dark)
--       fg = '#ADD8E6', -- light blue
--       -- fg = '#6C757D', -- lighter gray
--       ctermfg = 8,
--       force = true,
--     })
--   end,
-- })

-- return {
--   {
--     'github/copilot.vim',
--     config = function()
--       vim.g.copilot_enabled = 1
--       vim.g.copilot_workspace_folders = { '~/src/mine' }
--       -- vim.g.copilot_no_tab_map = 1
--       -- vim.g.copilot_no_insert_completion = 1
--     end,
--   },
-- }
