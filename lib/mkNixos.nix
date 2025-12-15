# mkNixos.nix :: Core System Assembler Directive
# This fragment weaves together the host's physical configuration,
# the user's persona matrix, and the myriad signals from the inputs.
# A delicate balance, easily disturbed. Proceed with caution.
{
  inputs,
  outputs,
  hostPath,
  homePath,
}: {
  username,
  hostname,
  server ? false,
  system ? "x86_64-linux",
}: let
  conf = import "${hostPath}/${hostname}";
  home = import "${homePath}/replika/${hostname}.nix";
  logic = import "${hostPath}/${hostname}/logic.nix";

  specialArgs = {inherit inputs outputs hostname username system;} // logic;
in
  inputs.nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules =
      [
        # Essential system services and drivers.
        inputs.disko.nixosModules.disko
        conf
      ]
      ++ (
        if server
        then []
        else [
          # Home Manager integration. The persona overlay.
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages =
                true; # Allow Home Manager to manage user-level packages.
              extraSpecialArgs = specialArgs; # Pass down the echoes.
              users.${username}.imports = [home]; # Apply the user's specific persona matrix.
            };
          }
        ]
      );
  }
