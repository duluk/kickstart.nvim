return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<C-H>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-J>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-K>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-L>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set('n', '<C-S-P>', function()
    --   harpoon:list():prev()
    -- end)
    -- vim.keymap.set('n', '<C-S-N>', function()
    --   harpoon:list():next()
    -- end)
  end,
}
