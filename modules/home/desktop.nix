{
  flake.homeModules.desktop = {pkgs, ...}: {
    services = {
      udiskie.enable = true;
    };

    programs = {
      cmus.enable = true;
      pyradio.enable = true;
      onlyoffice.enable = true;
    };

    home = {
      packages = with pkgs; [
        # System Apps
        simple-scan
        pdfsam-basic
      ];
    };

    xdg = {
      userDirs.enable = true;
      mimeApps.enable = true;
    };
  };
}
