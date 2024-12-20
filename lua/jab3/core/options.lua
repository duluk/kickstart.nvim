-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local function is_windows()
  return vim.loop.os_uname().sysname == 'Windows_NT'
end

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make line numbers default
vim.opt.number = true
-- Use relative line numbers, which is for jumping n lines with j/k
vim.opt.relativenumber = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Attempt to set ntrw (Explore) to tree style
vim.g.netrw_liststyle = 3

if is_windows() then
  -- Hard-code python3 location since Neovim is being weird about fidning it
  vim.g.python3_host_prog = 'C:\\Users\\jab3\\AppData\\Local\\Microsoft\\WindowsApps\\python3.exe'
end

-- Helps color schemes display properly
vim.opt.termguicolors = true
vim.opt.guicursor = ''
-- If colorscheme has a dark variant, use it
-- vim.opt.background = 'dark'
-- vim.o.transparent = true

-- Force backspace to behave "as expected"
vim.opt.backspace = 'indent,eol,start'

-- I go back and forth with 2 and 4. I think 4 looks better (today), but work uses 2.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.colorcolumn = '80'
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#232323' })
-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- if vim.fn.executable 'wl-copy' == 1 then
--   vim.g.clipboard = {
--     name = 'wl-copy',
--     copy = {
--       ['+'] = 'wl-copy',
--       ['*'] = 'wl-copy --primary',
--     },
--     paste = {
--       ['+'] = 'wl-paste',
--       ['*'] = 'wl-paste --primary',
--     },
--     cache_enabled = 0,
--   }
-- if vim.fn.executable 'xclip' == 1 then
--   vim.g.clipboard = {
--     name = 'xclip',
--     copy = {
--       ['+'] = 'xclip -selection clipboard',
--       ['*'] = 'xclip -selection primary',
--     },
--     paste = {
--       ['+'] = 'xclip -selection clipboard -o',
--       ['*'] = 'xclip -selection primary -o',
--     },
--     cache_enabled = 0,
--   }
-- end
-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy '+',
--     ['*'] = require('vim.ui.clipboard.osc52').copy '*',
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste '+',
--     ['*'] = require('vim.ui.clipboard.osc52').paste '*',
--   },
-- }
--
-- Enable OSC 52 clipboard support
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy '+',
    ['*'] = require('vim.ui.clipboard.osc52').copy '*',
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste '+',
    ['*'] = require('vim.ui.clipboard.osc52').paste '*',
  },
}

-- vim.g.clipboard = nil
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
vim.opt.clipboard = 'unnamedplus'
-- end)
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     if vim.v.event.operator == 'y' then
--       vim.fn.system("base64 | tr -d '\n' | xargs -0 printf '\\033]52;c;%s\\007' > /dev/tty", vim.fn.getreg '"')
--     end
--   end,
-- })

-- Enable break indent
vim.opt.breakindent = true

-- One of the greatest optinos ever
vim.opt.virtualedit = 'block'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Time in ms with no activity to fsync swap file (default 4000)
vim.opt.updatetime = 500

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
-- Set the color of the cursorline
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#232323' })

-- I had this false, but I am so used to the vi/vim line wrap that I want it,
-- so ensuring it's set
vim.opt.wrap = true

-- Break lines at this character:
vim.opt.breakat = ' '
-- Break lines at word boundaries:
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = true
-- This should tie to undo plugin
vim.opt.undofile = true
if not is_windows() then
  vim.opt.backupdir = os.getenv 'HOME' .. '/.local/state/nvim/backup'
  vim.opt.undodir = os.getenv 'HOME' .. '/.local/state/nvim/undo'
end

-- Don't keep search terms highlighted
vim.opt.hlsearch = false
-- Highlight in-file matches as type a search
vim.opt.incsearch = true
