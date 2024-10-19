{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ./hyprland.nix
    ../../Layers/Emacs/emacs.nix
    ../../Layers/XDG/user-dirs.nix
    ../../Layers/Terminal/terminal.nix
    ../../Layers/Firefox/firefox.nix
    ../../Layers/System-Tools/systemTools.nix
    ../../Layers/Social-Tools/socialTools.nix
    ../../Layers/Accounting-Tools/accountingTools.nix
  ;

  programs.home-manager.enable = true;

  home = {
    username = "xin";
    homeDirectory = "/home/xin";
    stateVersion = "23.11";
  };

  nixpkgs = {
    overlays = [
    #  outputs.overlays.additions
    #  outputs.overlays.modifications
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  systemd.user.startServices = "sd-switch";
}
