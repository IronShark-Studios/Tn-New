{ inputs, outputs, lib, config, pkgs, ... }: {

  system.stateVersion = "24.05";

  imports = [
    ./hardware-configuration.nix
    ./Sub-Modules/nixpkgs.nix
    ./Sub-Modules/users.nix
    ./Sub-Modules/utf.nix
    ./Sub-Modules/system-pkgs.nix
    ./Sub-Modules/display-server.nix
    ./Sub-Modules/network.nix
    ./Sub-Modules/virtualization.nix
    ../../Layers/Scripts/rebuild.nix
    ../../Layers/Scripts/test.nix
    ../../Layers/Scripts/upgrade.nix
    ../../Layers/Scripts/update-archives.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };

  systemd.sleep.extraConfig = ''
    HandleSuspend=ignore
  '';
}
