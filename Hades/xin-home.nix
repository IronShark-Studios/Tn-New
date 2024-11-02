{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    username = "xin";
    homeDirectory = "/home/xin";
    stateVersion = "23.11";
  };

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ../Layers/User/Emacs/emacs.nix
    ../Layers/User/xdg.nix
    ../Layers/User/Terminal/terminal.nix
    ../Layers/User/Firefox/firefox.nix
    ../Layers/User/System-Tools/systemTools.nix
    ../Layers/User/Social-Tools/socialTools.nix
    ../Layers/User/Accounting-Tools/accountingTools.nix
    ../Layers/User/Art-Tools/artTools.nix
    ../Layers/User/Games/ffxiv.nix
    ../Layers/User/Knowledge-Tools/knowledge.nix
    ../Layers/User/Baduk-Tools/baduk.nix
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
