return {
  {
    'augmentcode/augment.vim',
    config = function()
      vim.g.augment_enabled = 0
      vim.g.augment_workspace_folders = {
        '~/src/open-webui',
        '~/src/mine',
        '~/src/wego',
      }
    end,
  },
}
