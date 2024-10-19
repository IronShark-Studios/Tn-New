{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      sddm-chili-theme
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

    greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "/bin/tuigreet --time --time-format '%a, %d %b %Y • %T' --greeting  '[Become \n          Visible]' --asterisks --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

#    displayManager.sddm = {
#      enable = true;
#      wayland.enable = true;
#      autoNumlock = true;
#      theme = "chili";
#    };
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

  };
}
