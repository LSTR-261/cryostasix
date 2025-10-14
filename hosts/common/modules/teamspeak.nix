{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.teamspeak;
in {
  options.modules.teamspeak.enable = mkEnableOption "enable teamspeak";

  config = mkIf cfg.enable {
    services.teamspeak3 = {
      enable = true;
      openFirewall = true;
    };
  };
}
