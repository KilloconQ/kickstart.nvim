return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<leader>ft', '<cmd>ToggleTerm direction=float<cr>',      desc = 'Terminal (float)' },
    { '<leader>fT', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Terminal (horizontal)' },
    { '<c-/>',      '<cmd>ToggleTerm<cr>',                      desc = 'Toggle Terminal' },
    { '<c-/>',      '<cmd>ToggleTerm<cr>',                      desc = 'Toggle Terminal', mode = 't' },
  },
  opts = {
    float_opts = {
      border = 'curved',
    },
  },
}
