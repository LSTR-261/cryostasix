{
  imports = [
    ./home.nix
  ];

  modules = {
    cli = {
      nushell.enable = true;
    };
    graphical = {
      office.enable = true;
      gaming.enable = true;
      flatpak.enable = true;
      media.enable = true;
    };
  };
}
