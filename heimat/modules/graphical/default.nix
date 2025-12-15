{pkgs, ...}: {
  imports = [
    ./flatpak.nix
    ./gaming.nix
    ./desktop
    ./internet.nix
    ./media.nix
    ./office.nix
    ./theme.nix
  ];

  home.sessionPath = [];

  programs.foot.enable = true;
  programs.foot.settings.colors.alpha-mode = "all";

  programs.alacritty = {
    enable = true;
    settings = {
      window.padding.x = 3;
      window.padding.y = 3;
      window.dynamic_padding = true;
      colors.transparent_background_colors = true;
    };
  };
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      window_padding_width = 3;
      background_blur = 16;
      dynamic_background_opacity = true;
    };
  };
  home.packages = with pkgs; [
    wf-recorder
    wl-mirror
    wl-clipboard
    file-roller
    nautilus
    sushi
    legcord
    nchat
    signal-desktop
    impression
  ];
}
