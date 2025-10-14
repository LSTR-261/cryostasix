{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.open-webui;
in {
  options.modules.open-webui.enable = mkEnableOption "enable ollama";

  config = mkIf cfg.enable {
    virtualisation.oci-containers.containers.openwebui = {
      image = "ghcr.io/open-webui/open-webui:main";
      ports = ["3000:8080"];
      volumes = ["open-webui:/app/backend/data"];
    };
  };
}
