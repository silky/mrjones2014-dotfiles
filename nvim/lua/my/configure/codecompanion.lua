return {
  'olimorris/codecompanion.nvim',
  dev = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    {
      'stevearc/dressing.nvim', -- Optional: Improves the default Neovim UI
      opts = {},
    },
  },
  cmd = {
    'CodeCompanion',
    'CodeCompanionChat',
    'CodeCompanionToggle',
    'CodeCompanionActions',
  },
  config = function()
    require('codecompanion').setup({
      adapters = {
        chat = require('codecompanion.adapters').use(
          'ollama',
          { schema = { model = { default = 'dolphin-mixtral' } } }
        ),
        inline = require('codecompanion.adapters').use(
          'ollama',
          { schema = { model = { default = 'dolphin-mixtral' } } }
        ),
      },
    })
  end,
}
