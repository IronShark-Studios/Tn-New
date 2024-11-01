{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    username = "xin";
    homeDirectory = "/home/xin";
    stateVersion = "23.11";
  };

  imports = [
    ./hyprland.nix
    ./waybar.nix
 #   ../../Shared/Emacs/emacs.nix
    ../Layers/User/xdg.nix
    ../Layers/User/Terminal/terminal.nix
    ../Layers/User/Firefox/firefox.nix
    ../Layers/User/System-Tools/systemTools.nix
 #   ../../Shared/Social-Tools/socialTools.nix
 #   ../../Shared/Accounting-Tools/accountingTools.nix
 #   ../../Shared/Art-Tools/artTools.nix
 #   ../../Shared/FFXIV/ffxiv.nix
  ];

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.static-nxpkgs
      outputs.overlays.static-hmpkgs
      inputs.emacs-community.overlay
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  systemd.user.startServices = "sd-switch";
}
