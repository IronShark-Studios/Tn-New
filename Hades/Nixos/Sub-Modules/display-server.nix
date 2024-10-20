{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      sddm-chili-theme
      greetd.tuigreet
      hyprland
    ];
  };

  programs = {
    hyprland.enable = true;
    dconf.enable = true;
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services = {
    blueman.enable = true;
    udisks2.enable = true;
  #  libinput.enable = true;
    gnome.gnome-keyring.enable = true;

    xserver = {
      videoDrivers = [ "nvidia"];
      wacom.enable = true;
    };
   
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    # greetd = {
    #     enable = true;
    #     settings = {
    #       initial_session = {
    #         command = "${pkgs.hyprland}/bin/Hyprland";
    #         user = "user";
    #       };
    #       default_session = {
    #         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${pkgs.hyprland}/bin/Hyprland";
    #         user = "greeter";
    #       };
    #     };
    #   };

   displayManager.sddm = {
     enable = true;
     wayland.enable = true;
     autoNumlock = true;
     theme = "chili";
   };
  };

  xdg.portal = {   # Needed for OBS window capture.
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl.enable = true;
    xpadneo.enable = true;
    opentabletdriver.enable = true;

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:01:00:0";  # Found with lspci | grep VGA
        intelBusId = "PCI:00:02:0";  # Found with lspci | grep VGA
      };
    };
  };
}
