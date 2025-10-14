{
  pkgs,
  lib,
  inputs,
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
    loader.limine = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      style = {
        interface.branding = "CRYOSTASIX::PENROSE";
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = hostname; # System designation, received from the core.
    networkmanager.enable = true;
    # wireless.enable = true; # Enable if wireless capabilities are required.
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/${username}/.config/cryostasix/";
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

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
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = ["root" "${username}"];
    };
  };
}
