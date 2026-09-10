{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.HomeManager = {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      overwriteBackup = true;
      users.lowgain = self.homeModules.lowgainModule;
    };
  };
}
