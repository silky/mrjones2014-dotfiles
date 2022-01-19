function check-globals
    if test -z "(ls ~/Library/Fonts | grep Fira\ Code)"
        echo "Install Fira Code NerdFont: brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font"
    end

    if ! type diff-so-fancy &>/dev/null
        echo "Install diff-so-fancy and configure it as git's default diff handler: brew install diff-so-fancy, then see: https://github.com/so-fancy/diff-so-fancy#usage"
    end

    if ! type thefuck &>/dev/null
        echo "Install thefuck: https://github.com/nvbn/thefuck"
    end

    if ! type starship &>/dev/null
        echo "Install starship: https://github.com/starship/starship"
    end

    if ! type fisher &>/dev/null
        echo "Install fisher: https://github.com/jorgebucaran/fisher"
    end

    if ! fisher list | grep nvm.fish &>/dev/null
        echo "Install nvim.fish: fisher install jorgebucaran/nvm.fish"
    end

    if ! type nvim &>/dev/null
        echo "Install neovim: https://github.com/neovim/neovim"
    end

    if ! type fzf &>/dev/null
        echo "Install fzf: https://github.com/junegunn/fzf"
    end

    if ! type rg &>/dev/null
        echo "Install RipGrep: https://github.com/BurntSushi/ripgrep"
    end

    if ! type nvm &>/dev/null
        echo "Install nvm.fish: https://github.com/jorgebucaran/nvm.fish"
    end

    if ! type node &>/dev/null
        echo "Install node.js via nvm"
    end

    if ! type eslint_d &>/dev/null
        echo "Install eslint_d globally for Neovim integration: npm i -g eslint_d"
    end

    if ! type prettierd &>/dev/null
        echo "Install prettierd globally for Neovim integration: npm i -g @fsouza/prettierd"
    end

    if ! type typescript-language-server &>/dev/null
        echo "Install tsserver globally for vim integration: npm i -g typescript typescript-language-server"
    end

    if ! type vscode-css-language-server &>/dev/null
        echo "Install tsserver globally for vim integration: npm i -g vscode-langservers-extracted"
    end

    if ! type cargo &>/dev/null
        echo "Install rustup: curl --proto \"=https\" --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    end

    if ! type atuin &>/dev/null
        echo "Install atuin: cd ~/git/personal && git clone git@github.com:ellie/atuin.git && cd atuin && cargo install --path ."
    end

    if ! type ctrlg &>/dev/null
        echo "Install ctrlg: cd ~/git/personal && git clone git@github.com:mrjones2014/ctrlg.git && cd ctrlg && cargo install --path ."
    end

    if ! type stylua &>/dev/null
        echo "Install stylua: cargo install stylua --features lua52"
    end

    if ! type vale &>/dev/null
        echo 'Install vale: brew install vale'
    end

    if ! type shellcheck &>/dev/null
        echo 'Install shellcheck: brew install shellcheck'
    end

    if ! type shfmt &>/dev/null
        echo 'Install shfmt: brew install shfmt'
    end

    if ! type dotnet &>/dev/null
        echo 'Install dotnet: https://dotnet.microsoft.com/download/dotnet/5.0'
    end

    if ! type csharp-ls &>/dev/null
        echo 'Install csharp-ls: dotnet tool install --global csharp-ls'
    end

    if ! type bat &>/dev/null
        echo "Install bat: brew install bat"
    end

    if ! type exa &>/dev/null
        echo "Install exa: brew install exa"
    end

    if ! type luacheck &>/dev/null
        echo 'Install luacheck: luarocks install luacheck'
    end

    if ! type rust-analyzer &>/dev/null
        echo "Install rust-analyzer: brew install rust-analyzer"
    end

    if test -z "(ls ~/git/personal/lua-language-server/bin/macOS | grep lua-language-server)"
        echo "Install lua-language-server: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)"
    end

    if [ -z (python3 -m pip list | grep -F pynvim) ]
        echo "Install pynvim: python3 -m pip install pynvim"
    end

    if [ -z (ls /Applications/ | grep -i hammerspoon) ]
        echo "Install Hammerspoon: https://github.com/Hammerspoon/hammerspoon/releases/latest"
    end

    #  ~/.tmux/plugins/tpm
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]
        echo "Install tmux plugin manager: https://github.com/tmux-plugins/tpm"
    end

    if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start" ]
        echo "Install neovim packer: https://github.com/wbthomason/packer.nvim#quickstart"
    end

    return 0
end