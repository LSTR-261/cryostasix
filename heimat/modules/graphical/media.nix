{
  config,
  lib,
  pkgs,
  outputs,
  ...
}:
with lib; let
  cfg = config.modules.graphical.media;
in {
  options.modules.graphical.media.enable = mkEnableOption "enable media module";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      inkscape-with-extensions
      krita
      # pamixer
      pavucontrol
      # tenacity
      musescore
      muse-sounds-manager

      # kdePackages.kdenlive
      yt-dlp
      gimp3-with-plugins
      # stremio
      qbittorrent-enhanced
      # calibre
      vlc
    ];

    programs = {
      spotify-player.enable = true;
      obs-studio.enable = true;
      cavalier.enable = true;
      mpv = {
        enable = true;
        bindings = {
          WHEEL_UP = "seek 10";
          WHEEL_DOWN = "seek -10";
        };
        config = {
          profile = "gpu-hq";
          ytdl-format = "bestvideo+bestaudio";
        };
      };
    };
  };
}
