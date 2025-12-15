{
  pkgs,
  email,
  username,
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
    settings.user = {
      inherit email;
      name = "${username}";
    };
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
