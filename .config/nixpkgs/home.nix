{ config, pkgs, vscode, vscodeExtensions, ... }:


let nixGLIntel = (pkgs.callPackage "${builtins.fetchTarball {
      url = https://github.com/guibou/nixGL/archive/17c1ec63b969472555514533569004e5f31a921f.tar.gz;
      sha256 = "0yh8zq746djazjvlspgyy1hvppaynbqrdqpgk447iygkpkp3f5qr";
    }}/nixGL.nix" {}).nixGLIntel;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nixin72";
  home.homeDirectory = "/home/nixin72";
 
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    # pkgs.rofi
    pkgs.firefox
    pkgs.clojure
    pkgs.babashka
    pkgs.discord
    pkgs.neovim
    pkgs.exa
    pkgs.starship
    pkgs.nodejs
    pkgs.fira-code
    pkgs.noto-fonts
    pkgs.unzip
    pkgs.wakatime
    pkgs.nixFlakes
  ];

  programs.alacritty = {
    enable = true;
    package = pkgs.writeShellScriptBin "alacritty" ''
      #!/bin/sh 
      ${nixGLIntel}/bin/nixGLIntel ${pkgs.alacritty}/bin/alacritty
    '';
  };

  programs.git = {
    enable = true;
    userName = "nixin72";
    userEmail = "phdumaresq@protonmail.com";
    aliases = {
      st = "status";
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    extensions = (with pkgs.vscode-extensions; [
      betterthantomorrow.calva
      asvetliakov.vscode-neovim
    ]);
    # ++ vscode-utils.extensionsFromVscodeMarketplace [
    #  {
    #    name = "clj-kondo";
	#publisher = "borkdude";
	#version = "v2022.5.31";
      #}
      #{
       # name = "vscode-theme-onedark";
#	publisher = "akamud";
#	version = "v2.2.3";
#      }
#    ]);
  };

  programs.starship.enable = true;
  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      ignoreDups = true;
    };

    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    dirHashes = {
      repos = "$HOME/Documents/repos";
      work = "$HOME/Documents/work";
    };

    dotDir = ".config/zsh";

    shellAliases = {
      # Program Aliases
      vim = "nvim";
      yay = "paru";
      ls = "exa";
      ll = "ls -lah";
      la = "ls -lah";
      bb = "rlwrap bb";
      sbcl = "rlwrap sbcl";
      clojure = "rlwrap clojure";

      # Git Aliases
      gtfo = "git fetch origin";
      gc = "git commit";
      gca = "git commit --amend";
      gl = "git log --oneline";

      # Other
      wifioff = "nmcli radio wifi off";
      wifion = "nmcli radio wifi on";

      killuser = "loginctl kill-user $USER";
      reload = "source ~/.config/zsh/.zshrc";
      d = "dirs -v";
    };

    initExtra = ''

    '';

    envExtra = ''
      export SCRIPTS=$HOME/Documents/repos/dotfiles/scripts

      export ANDROID_HOME=$HOME/Android/Sdk
      export ANDROID_SDK_ROOT=/opt/android-sdk

      export NODE_PATH=$HOME/.npm-packages/lib/node_modules

      export JAVA_HOME=/usr/lib/jvm/default
      export GRAALVM_HOME=$JAVA_HOME
      export LLVM_TOOLCHAIN="($GRAALVM_HOME/bin/lli --print-toolchain-path)"

      export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
      export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
      export PATH=$PATH:$HOME/.npm-packages/bin
      export PATH=$PATH:$ANDROID_HOME/emulator
      export PATH=$PATH:$ANDROID_HOME/tools
      export PATH=$PATH:$ANDROID_HOME/tools/bin
      export PATH=$PATH:$ANDROID_HOME/platform-tools
      export PATH=$PATH:$JAVA_HOME/bin
      export PATH=$PATH:$SCRIPTS
      export PATH=$PATH:$HOME/.emacs.d/bin
    '';

    sessionVariables = {
      TERM = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less";
      BROWSER = "firefox";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
