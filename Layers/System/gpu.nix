{ inputs, outputs, lib, config, pkgs, ... }: {

 services.xserver.videoDrivers = [ "nvidia" ];

 hardware.nvidia = {

   modesetting.enable = true;

   prime = {
     sync.enable = true;
     nvidiaBusId = "PCI:01:00:0";  # Found with lspci | grep VGA
     intelBusId = "PCI:00:02:0";  # Found with lspci | grep VGA
   };

 };

}
