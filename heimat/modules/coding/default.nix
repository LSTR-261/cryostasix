{pkgs, ...}: {
  imports = [
    ./helix.nix
  ];

  home.packages = with pkgs; [
    nixd
    marksman
    markdown-oxide
    alejandra
    ripgrep
    scooter
    lazygit
    cargo
    tinymist
    devenv
  ];
}
