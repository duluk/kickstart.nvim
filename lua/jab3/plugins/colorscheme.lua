-- You can easily change to a different colorscheme.
return {
  'askfiy/visual_studio_code',
  lazy = false,
  priority = 1000,
  config = function()
    --    local transparent = true
    vim.cmd.colorscheme 'visual_studio_code'
  end,
-- } --, {
-- Change the name of the colorscheme plugin below, and then
-- change the command in the config to whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--  'folke/tokyonight.nvim',
--    priority = 1000, -- Make sure to load this before all the other start plugins.
--    config = function()
--      -- Load the colorscheme here.
--      -- Like many other themes, this one has different styles, and you could load
--      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--      vim.cmd.colorscheme 'tokyonight-night'
--
--      -- You can configure highlights by doing something like:
--      vim.cmd.hi 'Comment gui=none'
--    end,
}

--vim.cmd.colorscheme 'koehler'
--vim.cmd.colorscheme 'torte'
--vim.cmd.colorscheme 'visual_studio_code'
