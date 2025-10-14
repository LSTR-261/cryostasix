{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.forgejo;
in {
  options.modules.forgejo.enable = mkEnableOption "enable forgejo";

  config = mkIf cfg.enable {
    services.forgejo = {
      enable = true;
      database.type = "postgres";
      lfs.enable = true;
      settings = {
        server = {
          DOMAIN = "git.penrose.fritz.box";
          ROOT_URL = "http://penrose.fritz.box";
          HTTP_PORT = 3000;
        };
        service.DISABLE_REGISTRATION = true;
      };
    };
  };
}
