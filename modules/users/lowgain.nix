{self, ...}: {
  flake.nixosModules.lowgainModule = {
    users.users.lowgain = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "scanner" "lp"];
      home = "/home/lowgain";
      initialPassword = "Lowgain";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjw3UlPY0SebTuJ2/tDl1IMcOeJP7pBdGU29IVRbfyB logan.t2020@tutanota.com"
      ];
    };
  };

  flake.homeModules.lowgainModule = {
    lib,
    config,
    pkgs,
    ...
  }: {
    imports = [self.homeModules.lowgainTheme];
    config =
      lib.mkMerge [
        {
          home = {
            username = "lowgain";
            homeDirectory = "/home/lowgain";
            stateVersion = "26.05";
          };

          programs.git.settings = {
            user = {
              name = "Lowgain";
              email = "logan.t2020@tutanota.com";
            };
          };
        }
        (lib.mkIf config.wayland.windowManager.niri.enable {
          wayland.windowManager.niri.settings.spawn-sh-at-startup = "${pkgs.swaybg}/bin/swaybg -i /home/lowgain/Pictures/Walls/picture-shrine-green.jpg";
        })
        (lib.mkIf config.programs.qutebrowser.enable {
          xdg.mimeApps.defaultApplications = {
            "text/html" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
            "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
          };
        })
      ];
  };
}
