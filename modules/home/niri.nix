{
  /*
  self,
  */
  inputs,
  ...
}: {
  flake.homeModules.niri = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      "${inputs.home-manager-unstable}/modules/services/window-managers/niri.nix"
      #   self.homeModules.alacritty
      #   self.homeModules.fuzzel
      #   self.homeModules.waybar
    ];

    home.packages = with pkgs; [
      swaybg # Set Wallpaper
    ];

    programs = {
      alacritty = {
        enable = true;
        settings = {
          font.size = 14.0;
          window = {
            opacity = 0.8;
            padding = {
              x = 15;
              y = 15;
            };
          };
        };
      };
      fuzzel = {
        enable = true;
        settings = {
          main = {
            terminal = "${pkgs.alacritty}/bin/alacritty -e";
            font = "sans-serif:size=18";
            width = 40;
          };
        };
      };
      waybar.enable = true; # launch on startup in the default setting (bar)
      swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    };

    services = {
      mako.enable = true; # notification daemon
      swayidle.enable = true; # idle management daemon
      polkit-gnome.enable = true; # polkit
      gnome-keyring.enable = lib.mkDefault true;
    };

    wayland.windowManager.niri = {
      enable = true;
      enableDefaultConfig = true;
      settings = {
        input.focus-follows-mouse = {};
        prefer-no-csd = {};
      };
    };
  };
}
