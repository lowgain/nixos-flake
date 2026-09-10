{self, ...}: {
  flake.nixosModules.desktop = {
    lib,
    options,
    pkgs,
    ...
  }: {
    imports = [self.nixosModules.neovim];
    config = lib.mkMerge [
      {
        hardware.sane.enable = true;

        powerManagement = {
          enable = true;
          powertop.enable = true;
        };

        security = {
          sudo.wheelNeedsPassword = false;
          rtkit.enable = true;
        };

        fonts = {
          packages = with pkgs; [
            caladea
            carlito
            dejavu_fonts
            gentium
            liberation_ttf
            libertine
          ];
          enableDefaultPackages = true;
          fontDir.enable = true;
        };

        services = {
          pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
          };
          printing.enable = true;
          ipp-usb.enable = true;
          libinput.enable = true;
          udisks2.enable = true;
          upower.enable = true;
          power-profiles-daemon.enable = true;
        };

        programs = {
          chromium.enable = true;
          gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
          };
        };
      }
      (lib.optionalAttrs (options ? home-manager) {
        home-manager.sharedModules = [
          self.homeModules.desktop
          self.homeModules.shell
          self.homeModules.browsers
          self.homeModules.mpv
        ];
      })
    ];
  };
}
