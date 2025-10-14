{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.graphical.gaming;
in {
  options.modules.graphical.gaming.enable = mkEnableOption "install gaming related stuff";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gamescope
      winetricks
      mangohud
      protonup-qt
      protonplus
      wine
      lutris
      steam
      prismlauncher
      # luanti
    ];
  };
}
