{
  flake.homeModules.neovim = {pkgs, ...}: {
    home.sessionVariables.EDITOR = "nvim";
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        nixd
        lua-language-server
      ];
      initLua = builtins.readFile ./nvim/init.lua;
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-lua
          p.tree-sitter-bash
        ]))
        vim-nix
        {
          plugin = mini-pick;
          config = ''require("mini.pick").setup()'';
        }
      ];
    };
    xdg.configFile = {
      "nvim/lua" = {
        source = ./nvim/lua;
        recursive = true;
      };
    };
  };
}
