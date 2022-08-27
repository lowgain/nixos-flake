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
  # home.packages = with pkgs; [
  # ];

  xsession = {
    windowManager = {
      bspwm = {
        startupPrograms = [
          "polybar mybar -r"
          "pa-applet"
          "xrandr --screen 0 --size 1600x900"
        ];
        monitors = {
#           eDP = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
        };
      };
    };
  };
}
