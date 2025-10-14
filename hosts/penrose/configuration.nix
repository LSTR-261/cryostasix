{
  pkgs,
  inputs,
  ...
}: {
  imports = [../common ./services]; #++ [inputs.noctalia.nixosModules.noctalia];

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = true;
  services.xserver.xkb = {
    layout = "eu";
  };
  programs.niri.enable = true;
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  modules = {
    flatpak.enable = true;
    displaymanager.enable = true;
    hyprland.enable = true;
    virtualisation.enable = true;
    podman.enable = true;
  };

  services = {};

  home-manager.backupFileExtension = "backup";

  environment.systemPackages = with pkgs; [
  ];

  networking.firewall.allowedTCPPorts = [];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
