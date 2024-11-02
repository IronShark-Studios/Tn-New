{ inputs, outputs, lib, config, pkgs, ... }: 

let
  zen = pkgs.callPackage (import ./Zen/zen.nix) {};

in {

  imports = [
    ./tridactyl.nix
    ./userChrome.nix
    ./userPolicies.nix
  ];

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs.tridactyl-native ];
  };

  home.packages = with pkgs; [
  zen
  ];
}
