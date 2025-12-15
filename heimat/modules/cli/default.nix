{ pkgs, ... }:
{
  imports = [
    ./nushell.nix
    ./utilites.nix
    ./fish.nix
  ];

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.television = {
    enable = true;
    settings.ui.use_nerd_font_icons = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zellij = {
    enable = true;
  };

  # programs.starship = {
  #   enable = true;
  #   enableFishIntegration = true;
  #   settings = {
  #     add_newline = true;
  #   };
  # };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;

  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override { _7zz = pkgs._7zz-rar; };
    enableFishIntegration = true;
  };

  home.packages = with pkgs; [
    fishPlugins.autopair
    fishPlugins.tide
    btop-cuda
    dust
    eza
    fd
    fend
    lazygit
    nix-index
    nix-output-monitor
    ouch
    progress
    ripgrep-all
    skim
    tealdeer
    trash-cli
    wireguard-tools
  ];
}
