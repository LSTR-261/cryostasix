{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
    inputs.dms.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    niri = {
      enableSpawn = true;
      enableKeybinds = true;
    };
    quickshell.package = inputs.quickshell.packages.${pkgs.system}.default;
  };
}
