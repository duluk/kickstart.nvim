-- Github Copilot commented out at bottom

vim.api.nvim_create_user_command('CopilotToggle', function()
  vim.cmd('Copilot ' .. (vim.g.copilot_enabled == 0 and 'enable' or 'disable'))
end, {})
vim.keymap.set('n', '<leader>ct', '<Cmd>CopilotToggle<CR>', { noremap = true, silent = true })

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

return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = 0
      vim.g.copilot_workspace_folders = { '~/src/mine' }
      vim.g.copilot_filetypes = {
        ['*'] = true,
        ['dap-repl'] = false,
        ['dapui_breakpoints'] = false,
        ['dapui_console'] = false,
        ['dapui_scopes'] = false,
        ['dapui_stacks'] = false,
        ['dapui_watches'] = false,
        ['dapui_hover'] = false,
        ['dapui_repl'] = false,
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      agent = 'copilot',
      model = 'o3-mini',
      -- Other models:
      --   claude-3.7-sonnet
      --   claude-3.7-sonnet-thought
      --   gemini-2.0-flash-001
      --   gpt-4o
      --   gpt-4o-mini
      --   o1
      --   o3-mini
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
