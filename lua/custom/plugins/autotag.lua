return {
  'windwp/nvim-ts-autotag',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    opts = {
      -- Avoid InsertLeave crashes in prompt/non-parser buffers (e.g. Telescope)
      enable_rename = false,
    },
  },
}
