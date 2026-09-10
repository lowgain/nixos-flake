{inputs, ...}: {
  flake.homeModules.lowgainTheme = {pkgs, ...}: let
    papirus = pkgs.papirus-icon-theme.override {
      color = "green";
    };
  in {
    imports = [inputs.stylix.homeModules.stylix];
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-medium.yaml";

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Amber";
        size = 24;
      };

      icons = {
        enable = true;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
        package = papirus;
      };

      fonts = {
        sansSerif = {
          name = "Atkinson Hyperlegible Next";
          package = pkgs.atkinson-hyperlegible-next;
        };
        serif = {
          name = "Atkinson Hyperlegible Next";
          package = pkgs.atkinson-hyperlegible-next;
        };
        monospace = {
          name = "AtkynsonMono Nerd Font";
          package = pkgs.nerd-fonts.atkynson-mono;
        };
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };
        sizes = {
          applications = 12;
          desktop = 10;
          popups = 10;
          terminal = 14;
        };
      };

      opacity.terminal = 0.8;

      targets.neovim.transparentBackground = {
        main = true;
        numberLine = true;
        signColumn = true;
      };
    };
  };
}
