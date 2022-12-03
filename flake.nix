{
  description = "Logans personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/release-22.11";
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
                users.lowgain = {
                  imports = [( import ./hosts/laptop/home.nix )];
                };
              };
            }
          ];
        };

        vm = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/vm/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.lowgain = {
                  imports = [( import ./hosts/vm/home.nix )];
                };
              };
            }
          ];
        };

        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.lowgain = {
                  imports = [( import ./hosts/desktop/home.nix )];
                };
              };
            }
          ];
        };
      };
    };
}
