{
  description = "Logans personal flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    hyprland.url = "github:vaxerski/Hyprland";

  };

  outputs = inputs:

  let

    user = "lowgain";

  in {

    nixosConfigurations = (
      import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager user nur hyprland;
      }
    );

  };
}
