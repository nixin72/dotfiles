{ config, pkgs, lib, ... }:

let
  pkgs-unstable = import (pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "891f607d5301d6730cb1f9dcf3618bcb1ab7f10e";
    sha256 = "1cr39f0sbr0h5d83dv1q34mcpwnkwwbdk5fqlyqp2mnxghzwssng";
    fetchSubmodules = true;
  }) {};in
{
  imports =
    [
      ./hardware-configuration.nix
      # ./polybar.nix
    ];

  services.udev.packages = with pkgs-unstable; [ zsa-udev-rules ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["ntfs"];

  #########################################################
  ######## System #########################################
  #########################################################
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  #########################################################
  ######## Networking #####################################
  #########################################################

  networking.hostName = "nixin72";
  networking.wireless.enable = true;
  networking.wireless.networks = {
    "Din".psk = "gan0nd0rf";
  };

  networking.networkmanager = {
    enable=true;
    unmanaged = [
      "*" "except:type:wwan" "except:type:gsm"
    ];
  };

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.interfaces.usb0.useDHCP = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8000 9000 19000 19001 19002 ];
  networking.firewall.allowedUDPPorts = [ ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:pwd@proxy:port/";
  # networking.proxy.noProxy = "localhost,internal.domain";

  #########################################################
  ######## Locale #########################################
  #########################################################

  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  #########################################################
  ######## XServer ########################################
  #########################################################

  services.xserver = {
    enable = true;
      
    desktopManager = {
      xterm.enable = false;
      gnome3.enable = true;
    };

    windowManager.i3.enable = true;
    windowManager.exwm.enable = true;

    displayManager = {
      gdm.enable = true;
      defaultSession = "none+i3";
    };

    layout = "us";
    xkbOptions = "caps:hyper";

    videoDrivers = [ "displaylink" "modesetting" ];
  };


  #########################################################
  ######## Users ##########################################
  #########################################################

  users.users.nixin72 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.extraUsers.nixin72 = {
    shell = pkgs.zsh;
  };

  #########################################################
  ######## Programs #######################################
  #########################################################

  programs = {
    # home-manager.enable = true;
    # command-not-found.enable = true;

    zsh = {
      enable = true;
    };

    # git = {
    #   enable = true;
    #   userName = "nixin72";
    #   userEmail = "phdumaresq@protonmail.com";
    # };
  };

  #########################################################
  ######## Services #######################################
  #########################################################

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  #########################################################
  ######## Fonts ##########################################
  #########################################################

  fonts.fonts = with pkgs; [
    fira-code
    font-awesome
    noto-fonts
  ];

  #########################################################
  ######## Packages #######################################
  #########################################################

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # utilities
    wget curl git
    zsh alacritty starship
    tree fzf 
    htop neofetch
    flameshot
    zip unzip
    dmenu
    wakatime
    wally-cli

    # text editors
    vscode
    neovim
    emacs

    # compilers
    racket
    clojure leiningen clj-kondo
    jdk14 jre
    python39
    nodejs yarn
    sbcl swiProlog gcc10 clang_10 #348
    gnumake cmake
    mysql

    # GUI programs
    firefox
    spotify
    discord

    # gaming
    minecraft
    dolphinEmu
    steam
  ];

  #########################################################
  ######## No touchy ######################################
  #########################################################
   
  # This value determines the NixOS release from which the 
  # default settings for stateful data, like file locations 
  # and database versions on your system were taken. It‘s 
  # perfectly fine and recommended to leave this value at 
  # the release version of the first install of this system. 
  # Before changing this value read the documentation for 
  # this option 
  # (e.g. man configuration.nix)
  # (e.g. https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}

