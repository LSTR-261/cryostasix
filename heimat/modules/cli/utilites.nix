{pkgs, ...}: {
  home.packages = with pkgs; [
    aria2
    dysk
    caligula
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
    # opencode
    unzip
  ];

  programs.nix-search-tv.enable = true;
  programs.nix-search-tv.enableTelevisionIntegration = true;
}
