{
  description = "Collection of personal workstation configurations";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nixos Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware";

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs:
    let
       inherit (self) outputs;
       # Supported systems for your flake packages, shell, etc.
       systems = [
         "x86_64-linux"
       ];

  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc

    # Your custom packages and modifications, exported as overlays
  #   overlays = import ./Flake/Overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
  #   nixosModules = import ./Flake/Modules/Nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
  #   homeManagerModules = import ./Flake/Modules/Home-Manager;

    # NixOS configuration entrypoint
    nixosConfigurations = {

      # Main Computer
      Hades = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main nixos configuration file <
          ./Hades/Nixos/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };

      # Laptop
      Thanatos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main nixos configuration file <
          ./Thanatos/nixos/configuration.nix
          nixos-hardware.nixosModules.thinkpad-t480s
          home-manager.nixosModules.home-manager
        ];
      };

      # Media PC   TODO: Move this into sever repo
      Artemis = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main nixos configuration file <
          ./Artemis/nixos/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

  };
}
