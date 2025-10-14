{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.graphical.flatpak;
in {
  options.modules.graphical.flatpak.enable =
    mkEnableOption "install flatpaks declaratively";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-software
      flatpak
    ];
  };
}
