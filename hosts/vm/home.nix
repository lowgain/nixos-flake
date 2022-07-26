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
        ];
        monitors = {
          Virtual-1 = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
        };
      };
    };
  };

  services.picom = {
    vSync = false;
    backend = "xrender";
  };

}
