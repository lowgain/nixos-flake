{ pkgs, ... }:

{

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font Mono Medium:size=12";
        dpi-aware = "auto";
      };

      cursor = {
        style = "block";
        blink = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = 1.0;
        background = "002b36";
        foreground = "839496";

        # Normal/regular colors (color palette 0-7)
        regular0 = "073642";  # black
        regular1 = "dc322f";  # red
        regular2 = "859900";  # green
        regular3 = "b58900";  # yellow
        regular4 = "268bd2";  # blue
        regular5 = "d33682";  # magenta
        regular6 = "2aa198";  # cyan
        regular7 = "eee8d5";  # white

        # Bright colors (color palette 8-15)
        bright0 = "08404f";   # bright black
        bright1 = "e35f5c";   # bright red
        bright2 = "9fb700";   # bright green
        bright3 = "d9a400";   # bright yellow
        bright4 = "4ba1de";   # bright blue
        bright5 = "dc619d";   # bright magenta
        bright6 = "32c1b6";   # bright cyan
        bright7 = "ffffff";   # bright white
      };
    };
  };

}
