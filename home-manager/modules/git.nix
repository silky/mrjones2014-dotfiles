{ pkgs, ... }:
let
  inherit (pkgs) git stdenv;
  inherit (stdenv) isLinux;
  git_checkout_fzf_script = pkgs.writeScript "git-ch.bash" ''
    #!${pkgs.bash}/bin/bash
    if test "$#" -ne 0; then
      if [[ "$*" = "master" ]] || [[ "$*" = "main" ]]; then
        git checkout "$(git branch --format '%(refname:short)' --sort=-committerdate --list master main | head -n1)"
      else
        git checkout "$@"
      fi
    else
      git branch -a --format="%(refname:short)" | sed 's|origin/||g' | grep -v "HEAD" | grep -v "origin" | sort | uniq | ${pkgs.fzf}/bin/fzf | xargs git checkout
    fi
  '';
in {
  programs = {
    delta = {
      enable = true;
      catppuccin.enable = true;
    };

    git = {
      enable = true;
      package = git.override {
        guiSupport = false; # gui? never heard of her.
      };
      ignores = [ "Session.vim" ".DS_Store" ".direnv/" ];
      aliases = {
        s = "status";
        newbranch = "checkout -b";
        commit-amend = "commit -a --amend --no-edit";
        prune-branches = ''
          !git branch --merged | grep -v \"master\" | grep -v \"main\" | grep -v \"$(git branch --show-current)\" | grep -v "[*]" >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches && git fetch --prune'';
        ch = "!${git_checkout_fzf_script}";
        mm = ''
          !git fetch && git merge "origin/$(git branch --format '%(refname:short)' --sort=-committerdate --list master main | head -n1)"'';
        add-ignore-whitespace =
          "!git diff --ignore-all-space | git apply --cached";
        copy-branch = "!git branch --show-current | ${
            if pkgs.stdenv.isDarwin then
              "pbcopy"
            else
              "xclip -selection clipboard"
          }";
        pending = "!git log $(git describe --tags --abbrev=0)..HEAD --oneline";
      };
      extraConfig = {
        user = {
          name = "Mat Jones";
          email = "mat@mjones.network";
          signingKey =
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDsT6GLG7sY8YKX7JM+jqS3EAti3YMzwHKWViveqkZvu";
        };
        pull = { rebase = false; };
        push = { autoSetupRemote = true; };
        commit = { gpgsign = true; };
        gpg = {
          format = "ssh";
          ssh = {
            program = if isLinux then
              "/run/current-system/sw/bin/op-ssh-sign"
            else
              "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
        };
        core = {
          autocrlf = false;
          pager = "${pkgs.delta}/bin/delta";
          fsmonitor = true;
          untrackedcache = true;
        };
        interactive = { diffFilter = "${pkgs.delta}/bin/delta --color-only"; };
        init = { defaultBranch = "master"; };
        delta = {
          line-numbers = true;
          navigate = true;
        };
        color = {
          ui = true;
          "diff-highlight" = {
            oldNormal = "red bold";
            oldHighlight = "red bold 52";
            newNormal = "green bold";
            newHighlight = "green bold 22";
          };
          diff = {
            meta = "11";
            frag = "magenta bold";
            func = "146 bold";
            commit = "yellow bold";
            old = "red bold";
            new = "green bold";
            whitespace = "red reverse";
          };
        };
        fetch = { prune = true; };
        checkout = { defaultRemote = "origin"; };
        # faster git server communications
        # https://git-scm.com/docs/protocol-v2
        protocol = { version = 2; };
        url = {
          "git@gitlab.1password.io:" = {
            insteadOf = "https://gitlab.1password.io/";
          };
          # Use HTTPS for cargo updates
          "https://github.com/rust-lang/crates.io-index" = {
            insteadOf = "https://github.com/rust-lang/crates.io-index";
          };
        };
      };
    };
  };
}
