-- if packer isn't already installed, install it
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Dependencies of other plugins
  use('nvim-lua/plenary.nvim')

  -- Themes
  -- use local version if its cloned
  if vim.fn.isdirectory(os.getenv('HOME') .. '/git/personal/lighthaus.nvim') > 0 then
    use({
      '~/git/personal/lighthaus.nvim',
      config = function()
        require('lighthaus').setup({ bg_dark = true })
      end,
    })
  else
    use(require('configure.theme'))
  end

  -- keybind manager
  use(require('configure.nest'))

  -- Editing enhancements and tools
  use(require('configure.tmux-navigator'))
  use(require('configure.vim-move'))
  use(require('configure.telescope'))
  use(require('configure.telescope-fzf-native'))
  use(require('configure.autopairs'))
  use(require('configure.tagalong'))
  use(require('configure.fterm'))
  use(require('configure.markdown-preview'))
  use(require('configure.comments'))

  -- Tim Pope plugins
  use(require('configure.vim-sleuth'))
  use(require('configure.vim-eunuch'))

  -- LSP + syntax
  use(require('configure.lspconfig'))
  use(require('configure.emmet'))
  use(require('configure.vim-go')) -- just used for gohtmltmpl syntax highlighting
  use(require('configure.completion'))
  use(require('configure.lspkind'))
  use(require('configure.vim-fish'))
  use(require('configure.trouble'))
  use(require('configure.treesitter'))
  use(require('configure.treesitter-playground'))

  -- UI + utils
  use(require('configure.gitsigns'))
  use(require('configure.icons'))
  use(require('configure.nvim-tree'))
  use(require('configure.indent-blankline'))
  use(require('configure.lualine'))
  use(require('configure.bufferline'))
  use(require('configure.colorizer'))
  use(require('configure.dashboard'))
  use(require('configure.todo-comments'))
  use(require('configure.nvim-notify'))

  if vim.fn.isdirectory(os.getenv('HOME') .. '/git/personal/yaclt.nvim') > 0 then
    -- yaclt
    use('~/git/personal/yaclt.nvim')
  end

  if vim.fn.isdirectory(os.getenv('HOME') .. '/git/personal/dash.nvim') > 0 then
    -- dash plugin I'm working on
    use({ '~/git/personal/dash.nvim' })
    -- use({ 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } })
    -- use({ 'camspiers/snap' })
  end

  if vim.fn.isdirectory(os.getenv('HOME') .. '/git/personal/tldr.nvim') > 0 then
    -- dash plugin I'm working on
    use({ '~/git/personal/tldr.nvim' })
  end
end)
