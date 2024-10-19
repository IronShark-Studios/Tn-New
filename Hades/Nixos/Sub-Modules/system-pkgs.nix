{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
# System level packages available to all users
      wget
      unzip
      alsa-utils
    ];
  };

  fonts.packages = with pkgs; [
    nerdfonts
    iosevka
    iosevka-comfy.comfy-wide-motion
    iosevka-comfy.comfy-wide-motion-duo
    sarasa-gothic
    overpass
    fira-code
    fira-go
  ];
}
