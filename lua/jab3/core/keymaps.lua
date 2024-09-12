-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands

-- Movement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window [V]ertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window [H]orizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make windows [E]qual size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tabs
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[O]pen new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[C]lose current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to [N]ext tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to [P]revious tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %f<CR>', { desc = 'Open current buffer in new tab' })

-- [[ Keymaps from Primeagen ]]

-- Allow moving highlighted lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- When Joining lines, keep cursor at 0
vim.keymap.set('n', 'J', 'mzJ`z')

-- For half-page up/down, keep cursor in middle of screen
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- While searching, keep hits in middle of screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- "greatest keymap ever" -The Primeagen
-- This allows you to paste over a highlighted word without losing the original
-- yanked term
vim.keymap.set('x', '<leader>p', '"_dP')

-- "next greatest keymap ever" -The Primeagen
-- From asbjornHaland. With leader-y, copies into the system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Map C-c to Esc so vertical Inserts will work; THIS is the greatest keymap
-- ever IMHO
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Capital Q is of the devil in vim
vim.keymap.set('n', 'Q', '<nop>')

-- Global replace of word point is on
vim.keymap.set('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
-- Make buffer-file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
