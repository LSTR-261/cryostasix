{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.hyprland;
in {
  options.modules.hyprland.enable = mkEnableOption "enable hyprland";

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    services.hypridle.enable = true;

    xdg.portal = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      xorg.xrandr
      brightnessctl
      hyprsunset
      hyprpicker
      hyprshot
    ];
  };
}
