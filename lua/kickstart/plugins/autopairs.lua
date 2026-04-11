-- autopairs
-- https://github.com/windwp/nvim-autopairs

---@module 'lazy'
---@type LazySpec
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Integración con blink.cmp: evita duplicar ) al aceptar un completion
  config = function()
    require('nvim-autopairs').setup {}
  end,
}
