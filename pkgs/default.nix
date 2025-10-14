{pkgs, ...}: {
  # Define your custom packages here
  basalt = pkgs.callPackage ./basalt.nix {};
  osintui = pkgs.callPackage ./osintui.nix {};
  arttime = pkgs.callPackage ./arttime.nix {};
}
