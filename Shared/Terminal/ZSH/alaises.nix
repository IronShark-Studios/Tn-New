{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.zsh.shellAliases = {
    cd = "cdd";
    ca = "clear && printf '\n%.0s' {1..100}";
    lf = "bash ~/.config/lf/lfimg/lfrun";
    find = "fd -i";
    find-m = "fd-menu";
    findx = "fd --regex";
    findx-m = "fdx-menu";
    grep = "rg -i";
    grep-m = "rg-menu";
    grepx = "rg --regex";
    grepx-m = "rgx-menu";
    cp = "cp -r";
    lx = "eza --icons --oneline --group-directories-first --color auto --all";
    ld = "eza --icons --oneline --group-directories-first --color auto --tree";
    lxd = "eza --icons --oneline --group-directories-first --color auto --tree --all --ignore-glob=\"??????????????????????????????????????\"";
    ll = "eza --icons --oneline --group-directories-first --color auto";
    ls = "eza --icons --oneline --group-directories-first --color auto --long";
    rm = "sudo trash-put -v";
    rm-s = "sudo shred -f";
    arc-sync = "bash /etc/scripts/update-archives.sh";
    power-off = "sudo trash-put ~/Downloads/* & trash-empty & sudo shutdown -h now";
    logout = "sudo kill -9 -1";
    restart = "sudo reboot";
    eo = "emacsclient -n -c";
    eoc = "emacsclient -n";
    rebuild = "bash /etc/scripts/rebuild.sh";
    upgrade = "bash /etc/scripts/upgrade.sh";
    test = "bash /etc/scripts/test.sh";
    clean = "sudo nix-collect-garbage --delete-old";
    devEnv = "nix develop -c zsh";
  };
}
