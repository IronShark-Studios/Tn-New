
{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    packages = with pkgs; [
      leela-zero
      maven
      zulu
    ];
  };
}
