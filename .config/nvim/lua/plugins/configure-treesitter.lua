return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    local colors = require('catppuccino.color_schemes.catppuccino')
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'gohtmltmpl' },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1500,
        colors = {
          colors.blue,
          colors.yellow,
          colors.magenta,
          colors.red,
          colors.orange,
          colors.cyan,
          colors.green,
        },
      },
    })
  end,
}
