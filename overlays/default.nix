{inputs, ...}: {
  additions = final: prev:
    (import ../pkgs {pkgs = final;})
    # // (inputs.blender-bin.overlays.default final prev);
    // (inputs.neovim-nightly-overlay.overlays.default final prev)
    // (inputs.niri.overlays.niri final prev);
}
