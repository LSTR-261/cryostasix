{pkgs, ...}: {
  home.packages = with pkgs; [
    aria2
    dysk
    nitch
    fastfetch
    nerdfetch
    onefetch
    tokei
    macchina
    unimatrix
    feh
    broot
    lstr
    # geminicommit
    flavours
    smassh
    typer
    toipe
    almonds
    lolcat
    viu
  ];

  programs.nix-search-tv.enable = true;
  programs.nix-search-tv.enableTelevisionIntegration = true;
}
