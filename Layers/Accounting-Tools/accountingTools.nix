{ inputs, outputs, lib, config, pkgs, ... }: {

  home = {
    packages = with pkgs; [
      gnucash
      ledger
      visidata
    ];
  };
}
