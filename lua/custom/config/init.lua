-- Custom configuration entry point
-- All config modules in this directory are loaded automatically

local config_dir = vim.fn.stdpath 'config' .. '/lua/custom/config'

for _, file in ipairs(vim.fn.glob(config_dir .. '/*.lua', true, true)) do
  local name = file:match '([^/]+)%.lua$'
  if name ~= 'init' then require('custom.config.' .. name) end
end
