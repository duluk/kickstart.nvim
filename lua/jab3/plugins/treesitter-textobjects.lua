return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true, -- load when treesitter loads as it is a dependency
  config = function()
    require('nvim-treesitter.configs').setup {
      modules = {},
      sync_install = false,
      auto_install = true,
      ensure_installed = {},
      ignore_install = {},
      textobjects = {
        select = {
          -- Any textobject is extended to include preceding or succeeding whitespace
          -- if true (default is false):
          include_surrounding_whitespace = true,
          -- Automatically jump forward to the closes textobject:
          lookahead = true,
          enable = true,
          keymaps = {
            ['o='] = { query = '@assignment.outer', desc = 'Select outer part of assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'Select inner part of assignment' },
            ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignemtn' },

            ['oa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument list' },
            ['ia'] = { query = '@parameter.innter', desc = 'Select inner part of a parameter/argument list' },

            ['oi'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            ['ol'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            ['of'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            ['om'] = { query = '@function.outer', desc = 'Select outer part of a function definition' },
            ['im'] = { query = '@function.inner', desc = 'Select inner part of a function definition' },

            ['oc'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
          },
        },
        -- To control what sort of selection mode is used for a given capture group
        -- selection_modes = {
        --   ['@parameter.outer'] = 'v', --charwise
        --   ['@function.outer'] = 'V', --linewise
        --   ['@class.outer'] = '<c-v>', --blockwise
        -- },
        -- swap = {
        --   -- TODO - finish this from Josean's video
        --   enable = true,
        --   -- swap_next = {
        --   --   ['<leader>a'] = '@parameter.inner',
        --   -- },
        --   -- swap_previous = {
        --   --   ['<leader>A'] = '@parameter.inner',
        --   -- },
        -- },
      },
    }
  end,
}
