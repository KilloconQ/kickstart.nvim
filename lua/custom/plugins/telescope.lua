return {
  'nvim-telescope/telescope.nvim',
  -- desactiva el que viene en init.lua
  enabled = true,
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable 'make' == 1 end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    -- LazyVim style keymaps
    vim.keymap.set('n', '<leader><space>', builtin.find_files,   { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>,',       builtin.buffers,      { desc = 'Switch Buffer' })
    vim.keymap.set('n', '<leader>/',       builtin.live_grep,    { desc = 'Grep (root)' })
    vim.keymap.set('n', '<leader>:',       builtin.command_history, { desc = 'Command History' })

    -- [f]ind
    vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles,    { desc = 'Recent Files' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps,     { desc = 'Keymaps' })

    -- [s]earch
    vim.keymap.set('n', '<leader>sh', builtin.help_tags,    { desc = 'Search Help' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps,      { desc = 'Search Keymaps' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin,      { desc = 'Search Select Telescope' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep,    { desc = 'Search by Grep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics,  { desc = 'Search Diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume,       { desc = 'Search Resume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles,     { desc = 'Search Recent Files' })
    vim.keymap.set('n', '<leader>sc', builtin.commands,     { desc = 'Search Commands' })
    vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })

    -- buscar en config de nvim
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search Neovim files' })

    -- LSP (se activan cuando hay un LSP en el buffer)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf
        vim.keymap.set('n', 'grr', builtin.lsp_references,              { buffer = buf, desc = 'Goto References' })
        vim.keymap.set('n', 'gri', builtin.lsp_implementations,         { buffer = buf, desc = 'Goto Implementation' })
        vim.keymap.set('n', 'grd', builtin.lsp_definitions,             { buffer = buf, desc = 'Goto Definition' })
        vim.keymap.set('n', 'gO',  builtin.lsp_document_symbols,        { buffer = buf, desc = 'Document Symbols' })
        vim.keymap.set('n', 'gW',  builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Workspace Symbols' })
        vim.keymap.set('n', 'grt', builtin.lsp_type_definitions,        { buffer = buf, desc = 'Goto Type Definition' })
      end,
    })
  end,
}
