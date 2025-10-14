{
  pkgs,
  email,
  ...
}: {
  imports = [
    ../common
    ../modules/cli
    ../modules/coding
    ../modules/graphical
    ./dotfiles.nix
  ];
  home = {
    packages = with pkgs; [
    ];
    file = {
    };
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = 1;
      TERMINAL = "kitty";
      NIX_PATH = "nixpkgs=channel:nixos-unstable";
    };
    stateVersion = "24.11";
  };

  programs.git = {
    enable = true;
    difftastic.enable = true;
    userName = "lstr-261";
    userEmail = "${email}";
    extraConfig = {
      core.excludesfile = "~/.gitignore_global";
      init.defaultBranch = "master";
    };
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
