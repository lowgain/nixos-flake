{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    experimentalBackends = true;
    fade = true;
  };
}
