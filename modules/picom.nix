{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    experimentalBackends = true;
    fade = true;
    opacityRules = [
      "70:class_g = 'Alacritty'"
      "70:class_g = 'Thunar'"
    ];
    settings.blur.method = "dual_kawase";
  };
}
