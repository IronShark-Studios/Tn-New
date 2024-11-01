{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    username = "xin";
    homeDirectory = "/home/xin";
    stateVersion = "23.11";
  };

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ../Layers/Emacs/emacs.nix
    ../Layers/User/xdg.nix
    ../Layers/User/Terminal/terminal.nix
    ../Layers/User/Firefox/firefox.nix
    ../Layers/User/System-Tools/systemTools.nix
    ../Layers/Social-Tools/socialTools.nix
    ../Layesr/Accounting-Tools/accountingTools.nix
    ../Layers/Art-Tools/artTools.nix
    ../Layers/Games/ffxiv.nix
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
