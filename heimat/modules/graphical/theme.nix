{
  pkgs,
  username,
  ...
}: {
  stylix = {
    enable = true;
    polarity = "dark";
    iconTheme = {
      enable = true;
      dark = "rose-pine-moon";
      package = pkgs.rose-pine-icon-theme;
    };
    targets = {
      zen-browser.profileNames = ["${username}"];
      kde.useWallpaper = false;
      obsidian.vaultNames = ["papillon"];
    };
  };
  qt.enable = true;
  gtk.enable = true;
}
