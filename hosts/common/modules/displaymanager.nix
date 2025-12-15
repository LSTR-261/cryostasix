{
  config,
  lib,
  username,
  ...
}:
with lib; let
  cfg = config.modules.displaymanager;
in {
  options.modules.displaymanager.enable = mkEnableOption "enable displaymanager";

  config = mkIf cfg.enable {
    services.displayManager = {
      enable = true;
      ly = {
        enable = true;
        settings = {
          # animation = "colormix";
          asterisk = "?";
          bigclock = "en";
          bigclock_seconds = true;
          clear_password = true;
          edge_margin = 3;
          numlock = true;
          waylandsessions = "/home/${username}/.config/cryostasix/lib/nichts/wayland-sessions";
        };
      };
    };
  };
}
