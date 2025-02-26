return {
  {
    'augmentcode/augment.vim',
    config = function()
      vim.g.augment_enabled = 1
      vim.g.augment_disable_tab_mapping = 0
      vim.g.augment_node_command = '/usr/bin/node'
      vim.g.augment_workspace_folders = {
        '~/src/open-webui',
        '~/src/mine',
        '~/src/wego',
      }
    end,
  },
}
