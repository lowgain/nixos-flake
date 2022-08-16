{ config, pkgs, ... }:

{
  imports = [( import ../../modules )];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marshey";
  home.homeDirectory = "/home/marshey";

  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install applications
  home.packages = with pkgs; [
    neofetch
    pavucontrol
    librewolf
    spotify
    discord
    wineWowPackages.staging
    mullvad-vpn
    brightnessctl
    cmus
    veracrypt
    gnucash
    xfce.thunar
    xfce.xfce4-terminal
    deluge
    mate.atril
    ardour
    swh_lv2
    lsp-plugins
    guitarix
    tonelib-metal
    tonelib-gfx
    libreoffice
  ];

  xsession = {
    windowManager = {
      bspwm = {
        startupPrograms = [
          "polybar mybar -r"
          "mullvad-vpn"
          "deluge-gtk"
          "blueman-applet"
          "pa-applet"
        ];
        monitors = {
#          eDP = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
        };
      };
    };
  };
}
