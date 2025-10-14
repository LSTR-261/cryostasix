# hosts/common/users/lstr-261.nix :: Replika Unit LSTR-261 Persona Record
# Access Level: Kolibri
# Caution: Modifying core parameters may lead to personality degradation or resonance cascade.
{pkgs, ...}: {
  users.users.lstr-261 = {
    initialPassword = "277353";
    isNormalUser = true;
    description = "LSTR-261 // Elster Replika Unit";
    extraGroups = [
      # Access Privileges & System Interface Clearances
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "storage"
      "input"
      "kvm"
      "qemu-libvirtd"
      "adbusers"
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      # Add public SSH keys here for remote secure shell access.
      # Example: "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMnotWhatYouThinkthisIs 실제 키가 아닙니다 lstr-261@penrose"
    ];
  };
  programs.fish = {enable = true;};
  # Backup file extension for Home Manager managed files. A failsafe against memory corruption.
}
