-- Configuring Neovim
require('disable-builtins')
require('plugins')
require('settings')
require('lsp-init')
require('custom-commands')
require('keybinds')
require('custom-filetypes')

-- Configuring Plugins
require('configure-plugins-generic')
require('configure-indent-blankline')
require('configure-colorizer')
require('configure-nvimtree')
require('configure-dashboard')
require('configure-autopairs')
require('configure-lualine')
require('configure-tabline')
require('configure-lspkind')
require('configure-compe')
require('configure-trouble')
require('configure-treesitter')
require('configure-theme')
