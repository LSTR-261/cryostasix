{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      rb = "nh os switch ~/.config/cryostasix";
      sp = "spotify_player";
      c = "cd ~/.config/cryostasix && hx .";
      nfu = "nix flake update";
      u = "nix flake update nixpkgs home-manager stylix";
      v = "hx";
      lg = "lazygit";
      x = "sudo rm -rf";
    };
    binds = {
      "ctrl-z" = {
        command = "fg 2>/dev/null; commandline -f repaint";
      };
    };
  };
}
