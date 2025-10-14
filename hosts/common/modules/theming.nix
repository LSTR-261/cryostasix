{
  inputs,
  pkgs,
  wallpaper,
  username,
  theme,
  ...
}:
# scheme = config.modules.theming.theme; # terracotta, rose-pine(-moon), catpuccin(-mocha, -macchiato), zenburn, sandcastle, zenbones, moonlight, lime, kimber, kanagawa, horizon-terminal-dark, everforest-dark-hard, dracula, caroline
{
  imports = [inputs.stylix.nixosModules.stylix];
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
    image = "/home/${username}/Pictures/Wallpapers/${wallpaper}";
    cursor = {
      name = "BreezeX-RosePine-Linux";
      size = 32;
      package = pkgs.rose-pine-cursor;
    };
    fonts = {
      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 23;
      };
      # nerd-fonts.iosevka-term-slab
      # nerd-fonts.bigblue-terminal
      # nerd-fonts.fira-code
      # nerd-fonts.zed-mono
      sansSerif = {
        name = "Iosevka Nerd Font";
        package = pkgs.nerd-fonts.iosevka;
      };
      serif = {
        name = "TeX Gyre Schola";
        package = pkgs.gyre-fonts;
      };
      monospace = {
        name = "IosevkaTermSlab Nerd Font";
        # name = "VictorMono Nerd Font";
        package = pkgs.nerd-fonts.iosevka-term-slab;
      };
    };
    opacity = {
      applications = 1.0;
      desktop = 0.75;
      popups = 0.75;
      terminal = 0.7;
    };
    targets = {
      # grub.useWallpaper = true;
    };
  };
}
