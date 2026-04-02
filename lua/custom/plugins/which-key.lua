return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts_extend = { 'spec' },
  opts = {
    preset = 'helix',
    spec = {
      {
        mode = { 'n', 'x' },
        { '<leader>c', group = 'code' },
        { '<leader>f', group = 'file/find' },
        { '<leader>g', group = 'git' },
        { 'gs', group = 'surround' },
        { '<leader>gh', group = 'hunks' },
        { '<leader>q', group = 'quit/session' },
        { '<leader>s', group = 'search' },
        { '<leader>u', group = 'ui' },
        { '<leader>x', group = 'diagnostics/quickfix' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },
        {
          '<leader>b',
          group = 'buffer',
          expand = function() return require('which-key.extras').expand.buf() end,
        },
        {
          '<leader>w',
          group = 'windows',
          proxy = '<c-w>',
          expand = function() return require('which-key.extras').expand.win() end,
        },
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function() require('which-key').show { global = false } end,
      desc = 'Buffer Keymaps (which-key)',
    },
  },
}
