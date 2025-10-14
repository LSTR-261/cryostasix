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
      firefox = {
        profileNames = ["${username}"];
        colorTheme.enable = true;
      };
      zen-browser.profileNames = ["${username}"];
      neovim = {
        plugin = "base16-nvim";
        transparentBackground = {
          main = true;
          numberLine = true;
          signColumn = true;
        };
      };
      helix.enable = false;
      waybar = {
        enableLeftBackColors = true;
        enableCenterBackColors = true;
        enableRightBackColors = true;
      };
      kde.useWallpaper = false;
      obsidian.vaultNames = ["papillon"];
    };
  };
  qt.enable = true;
  gtk.enable = true;
}
