-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Attempt to set ntrw (Explore) to tree style
vim.g.netrw_liststyle = 3

-- Helps color schemes display properly
vim.opt.termguicolors = true
-- If colorscheme has a dark variant, use it
vim.opt.background = 'dark'

-- Force backspace to behave "as expected"
vim.opt.backspace = 'indent,eol,start'

-- Using 2 because Company practice
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.colorcolumn = ''
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#232323' })
vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

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

vim.opt.wrap = false
-- Break lines at this character:
vim.opt.breakat = ' '
-- Break lines at word boundaries:
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.backupdir = os.getenv 'HOME' .. '/.local/state/nvim/backup'
-- This should tie to undo plugin
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.local/state/nvim/undo'

-- Don't keep search terms highlighted
vim.opt.hlsearch = false
-- Highlight in-file matches as type a search
vim.opt.incsearch = true
