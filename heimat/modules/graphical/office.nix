{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.graphical.office;
in {
  options.modules.graphical.office.enable =
    mkEnableOption "install office and paperwork stuff";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      typst
      basalt
      bagels
      slides
      mdp
      onionshare
      freerdp
      trilium-desktop
    ];

    programs.onlyoffice.enable = true;
    programs.zathura.enable = true;
    programs.obsidian.enable = true;
    # programs.element-desktop.enable = true;
  };
}
