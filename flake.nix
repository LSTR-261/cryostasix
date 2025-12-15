{
  description = ''
    CRYOSTASIX // System Calibration Protocol // Penrose Program Cycle Ver. 3.6
    "Remember your promise."
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";
    ragenix.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs";

    quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, ... }@inputs:
    let
      inherit (self) outputs;
      homePath = ./heimat;
      hostPath = ./hosts;
      mkNixos = import ./lib/mkNixos.nix {
        inherit
          inputs
          outputs
          homePath
          hostPath
          ;
      };
    in
    {
      nixosConfigurations = {
        penrose = mkNixos {
          username = "lstr-261";
          hostname = "penrose";
        };
      };
      overlays = import ./overlays { inherit inputs outputs; };
    };
}
