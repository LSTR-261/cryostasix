{pkgs, ...}: {
  imports = [
    ./helix.nix
  ];

  home.packages = with pkgs; [
    marksman
    markdown-oxide
    ripgrep
    scooter
    lazygit
    cargo
    tinymist
    devenv
  ];
}
