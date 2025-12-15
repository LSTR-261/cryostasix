{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.graphical.walker;
in {
  options.modules.graphical.walker.enable = mkEnableOption "enable walker";
  config = mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          show-actions = true;
          lines = 12;
          tabs = 2;
        };
        border = {
          width = 2;
          radius = 12;
        };
      };
    };
    services.clipse = {
      enable = true;
      historySize = 2048;
      imageDisplay = {
        type = "kitty";
        scaleX = 16;
        scaleY = 16;
      };
    };
  };
}
