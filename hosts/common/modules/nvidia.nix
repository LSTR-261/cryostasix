{
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    nvidia-container-toolkit.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # nvtopPackages.nvidia
    lact
    alsa-utils
    vulkan-tools
    libva-utils
    vdpauinfo
    egl-wayland
  ];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  boot.kernelParams = ["nvidia_drm.modeset=1"];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    NVD_BACKEND = "direct";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
