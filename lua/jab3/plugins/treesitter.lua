return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  -- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      ensure_installed = {
        'awk',
        'bash',
        'c',
        'cpp',
        'css',
        'd',
        'diff',
        'dockerfile',
        'go',
        'html',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'ruby',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>', -- default, gnn
          node_incremental = '<C-space>', -- default, grn
          scope_incremental = false, -- default, grc
          node_decremental = '<bs>', -- default, grm
        },
      },
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      modules = {},

      -- List of parsers to ignore installing (or "all") [I'm assuming this matters
      -- only when auto_install is false]
      ignore_install = {},

      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
        -- additional_vim_regex_highlighting = {},
      },
      indent = { enable = true, disable = { 'ruby' } },
      -- indent = { enable = true },
    }
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
