{
  description = "Logans personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        laptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.marshey = {
                  imports = [ ./hosts/laptop/laptop.nix ];
                };
              };
            }
          ];
        };
        #vm = lib.nixosSystem {
        #  inherit system;
        #  modules = [
        #    ./configuration.nix
        #    home-manager.nixosModules.home-manager {
        #      home-manager = {
        #        useGlobalPkgs = true;
        #        useUserPackages = true;
        #        users.marshey = {
        #          imports = [ ./hosts/vm/vm.nix ];
        #        };
        #      };
        #    }
        #  ];
        #};
      };
    };
}
