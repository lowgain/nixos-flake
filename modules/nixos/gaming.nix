{self, ...}: {
  flake.nixosModules.gaming = {
    lib,
    options,
    pkgs,
    ...
  }: {
    config = lib.mkMerge [
      {
        programs = {
          gamemode.enable = true;
          steam.enable = true;
        };

        environment.systemPackages = with pkgs; [
          heroic
          lutris
          protonup-qt
        ];
      }
      (lib.optionalAttrs (options ? home-manager) {
        home-manager.sharedModules = [self.homeModules.gaming];
      })
    ];
  };
}
