{ config, pkgs, ... }:

{
  imports = [
    ( import ../../modules )
    ( import ../../modules/home-config.nix)
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lowgain";
  home.homeDirectory = "/home/lowgain";

  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install applications
  home.packages = with pkgs; [
    librewolf
    spotify
    discord
    wineWowPackages.staging
    lutris
    brightnessctl
    cmus
    gnucash
    xfce.thunar
    deluge
    mate.atril
    gamemode
#    ardour
#    swh_lv2
#    lsp-plugins
#    guitarix
#    tonelib-metal
#    tonelib-gfx
    gimp
    libreoffice
    openrgb
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

  xsession = {
    windowManager = {
      bspwm = {
        startupPrograms = [
          "polybar mybar -r"
          "mullvad-vpn"
          "deluge-gtk"
          "blueman-applet"
          "pa-applet"
          "$HOME/.screenlayout/default.sh"
          "feh --bg-fill $HOME/.background-image.*"
        ];
        monitors = {
          DisplayPort-0 = [ "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
        };
      };
    };
  };
}
