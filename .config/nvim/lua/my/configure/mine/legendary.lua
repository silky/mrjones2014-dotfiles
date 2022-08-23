local path

local paths = require('my.paths')
if vim.fn.isdirectory(paths.join(paths.home, 'git/github/legendary.nvim')) > 0 then
  path = '~/git/github/legendary.nvim'
else
  path = 'mrjones2014/legendary.nvim'
end

return {
  path,
  requires = {
    -- used by key mappings
    'fedepujol/move.nvim',
    -- 'folke/which-key.nvim',
  },
  config = function()
    require('legendary').setup({
      keymaps = require('my.keymap').default_keymaps(),
      commands = require('my.commands').default_commands(),
      autocmds = require('my.autocmds').default_autocmds(),
      select_prompt = function(kind)
        if kind == 'legendary.items' then
          return ' Legendary '
        end

        -- Convert kind to Title Case (e.g. legendary.keymaps => Legendary Keymaps)
        return ' ' .. string.gsub(' ' .. kind:gsub('%.', ' '), '%W%l', string.upper):sub(2) .. ' '
      end,
    })

    -- require('which-key').setup({
    --   plugins = {
    --     presets = {
    --       operators = false,
    --       motions = false,
    --       text_objects = false,
    --       windows = false,
    --       nav = false,
    --       z = false,
    --       g = false,
    --     },
    --   },
    -- })
    -- require('which-key').register({
    --   f = {
    --     name = 'file', -- optional group name
    --     f = { '<cmd>Telescope find_files<cr>', 'Find File' },
    --   },
    -- }, {
    --   prefix = '<leader>',
    -- })
  end,
}