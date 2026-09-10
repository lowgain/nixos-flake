{
  flake.homeModules.shell = {
    programs = {
      bash.enable = true;
      tmux = {
        enable = true;
        keyMode = "vi";
        extraConfig = ''
          set -g status-style bg=default
        '';
      };
      qalculate.enable = true;
      starship = {
        enable = true;
        presets = ["nerd-font-symbols"];
      };
      git.enable = true;
    };
  };
}
