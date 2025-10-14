{
  monitor,
  pkgs,
  ...
}: {
  wayland.windowManager.river = {
    enable = true;
    extraConfig = ''
      # Start essential applications
      # riverctl spawn 'waybar'

      # Start the layout generator
      riverctl spawn 'rivertile'

      # Set rivertile as the layout generator for all outputs
      for output in $(riverctl list-outputs | cut -d: -f1); do
          riverctl output-layout $output rivertile
      done

      # Keybindings
      set mod Mod4

      # Close focused window
      riverctl map normal $mod Q close

      # Launch terminal
      riverctl map normal $mod Return spawn 'kitty'

      # Launch application launcher
      riverctl map normal $mod Space spawn 'fuzzel'

      # Focus view
      riverctl map normal $mod J focus-view next
      riverctl map normal $mod K focus-view previous

      # Swap focused view
      riverctl map normal $mod+Shift J swap-view next
      riverctl map normal $mod+Shift K swap-view previous

      # Change layout orientation
      riverctl map normal $mod+Shift H send-layout-cmd rivertile "main-ratio -0.05"
      riverctl map normal $mod+Shift L send-layout-cmd rivertile "main-ratio +0.05"

      # Focus output
      riverctl map normal $mod+Control J focus-output next
      riverctl map normal $mod+Control K focus-output previous

      # Send focused view to output
      riverctl map normal $mod+Shift+Control J send-to-output next
      riverctl map normal $mod+Shift+Control K send-to-output previous

      # Tags (Workspaces)
      for i in $(seq 1 9); do
          tags=$((1 << ($i - 1)))
          riverctl map normal $mod $i set-focused-tags $tags
          riverctl map normal $mod+Shift $i set-view-tags $tags
      done
    '';
  };
}
