{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "c" = "clear";
      "home" = "cd ~";
      ".." = "cd ..";
      "..." = "cd ../..";
      "vim" = "nvim";
      "vi" = "nvim";
      "find" = "fd";
      "ls" = "exa";
      "ll" = "exa -l";
      "la" = "exa -la";
      "grep" = "rg";
    };
  };
}
