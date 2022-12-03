{ config, pkgs, ... }:

{
  imports = [( import ../../modules )];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marshey";
  home.homeDirectory = "/home/marshey";

  home.stateVersion = "22.11";

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
    spicetify-cli
    discord
    betterdiscordctl
    wineWowPackages.staging
    lutris
    brightnessctl
    cmus
    veracrypt
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
    jamesdsp
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

  xsession = {
    windowManager = {
      bspwm = {
        startupPrograms = [
          "polybar mybar -r"
          "deluge-gtk"
          "blueman-applet"
          "pa-applet"
          "jamesdsp"
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
