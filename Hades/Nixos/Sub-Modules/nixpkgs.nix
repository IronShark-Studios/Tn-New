{ inputs, outputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    overlays = [
     # outputs.overlays.additions
     # outputs.overlays.modifications
    ];

    config = {
      allowUnfree = true;
      hostPlatform = lib.mkDefault "x86_64-linux";
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };
}
