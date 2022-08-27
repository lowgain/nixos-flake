# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Select internationalisation properties.
  time.timeZone = "America/Nassau";
  i18n.defaultLocale = "en_US.utf8";

  services.xserver = {

    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.bspwm.enable = true;

    # Confiure keyboard layout
    layout = "us";
    xkbVariant = "";

  };

  # modify display method
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Enable sound
  sound.enable = true;
  security.rtkit.enable = true;
  services = {
    pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    };
  };

  # Git Service
  programs.git.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    ffmpeg_5
    killall
    unrar
    unzip
    traceroute
    ripgrep
    exa
    ranger
    fd
    pa_applet
    pavucontrol
    keepassxc
    neofetch
    cmatrix
    polybar
  ];

  users.users.marshey = {
    isNormalUser = true;
    description = "Logan Thompson";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "jackaudio" ];
    initialPassword = "password";
  };

  services = {

    # CUPS
    printing.enable = true;

    # Enable flash drives
    udisks2.enable = true;

    # Enable PC/SC
    pcscd.enable = true;

  };

  programs = {

    gnupg.agent.enable = true;

    dconf.enable = true;

  };

  fonts.fonts = with pkgs; [
    ubuntu_font_family
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

  system.stateVersion = "22.11";

}
