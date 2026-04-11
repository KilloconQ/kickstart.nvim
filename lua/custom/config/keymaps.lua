vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>qq', '<cmd>q<CR>')

vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

vim.keymap.set('n', '<leader>xx', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Normal + Visual
vim.keymap.set({ 'n', 'v' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save' })

-- Insert (sale a normal, guarda, vuelve a insert)
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<cr>a', { desc = 'Save' })

-- LSP: Source Action (Organize Imports, Add missing imports, etc.)
-- NOTA: gd, gr, gI, gy, gD, K, <leader>cr, <leader>ca, <leader>cA
-- se setean en LspAttach en init.lua (buffer-local, solo cuando hay LSP activo)
