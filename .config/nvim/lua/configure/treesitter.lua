return {
  'nvim-treesitter/nvim-treesitter',
  requires = { 'p00f/nvim-ts-rainbow', 'nvim-treesitter/nvim-treesitter-textobjects' },
  run = ':TSUpdateSync',
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
      },
      incremental_selection = {
        enable = true,
        -- keymaps defined in keymaps/init.lua
        keymaps = {},
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1500,
      },
      textobjects = {
        lsp_interop = {
          enable = true,
          border = 'rounded',
        },
      },
    })
  end,
}
