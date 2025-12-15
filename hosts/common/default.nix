{
  config,
  pkgs,
  outputs,
  username,
  hostname,
  ...
}: {
  imports = [
    ./modules
    ./users
  ];

  boot = {
    plymouth.enable = true;
    # kernelPackages = pkgs.linuxPackages_latest;
    loader.limine = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      style = {
        interface = {
          branding = "CRYOSTASIX::PENROSE";
        };
      };
    };
  };

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    # wireless.enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/${username}/.config/cryostasix/";
  };

  services.openssh.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [home-manager];

  programs.dconf.enable = true;

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
    ];
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes"; # Enable modern Nix interface.
      substituters = [
        "https://nix-community.cachix.org"
        "https://niri.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      ];
      trusted-users = ["root" "${username}"];
    };
  };
}
