{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.flatpak;
in {
  options.modules.flatpak.enable = mkEnableOption "enable flatpak";

  config = mkIf cfg.enable {
    services.flatpak.enable = true;
    xdg.portal = {
      # xdg desktop intergration (required for flatpak)
      enable = true;
      # config.common.default = ["gtk"];
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
      ];
    };
  };
}
