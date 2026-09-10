{self, ...}: {
  flake.nixosModules.niri = {
    lib,
    options,
    pkgs,
    ...
  }: {
    config = lib.mkMerge [
      {
        # imports = [ self.nixosModules.regreet ];

        hardware.graphics.enable = lib.mkDefault true;

        environment = {
          sessionVariables.NIXOS_OZONE_WL = "1";
          systemPackages = [pkgs.nautilus];
        };

        security.polkit.enable = true;

        programs = {
          regreet.enable = true;
          dconf.enable = true;
          niri.enable = true;
        };
      }
      (lib.optionalAttrs (options ? home-manager) {
        home-manager.sharedModules = [self.homeModules.niri];
      })
    ];
  };
}
