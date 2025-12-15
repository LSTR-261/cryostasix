{
  config,
  username,
  ...
}:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing.enable = true;

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/home/${username}/Storage" = {
    device = "/dev/disk/by-uuid/26d4d94b-3521-498b-bffd-e03805beace9";
    fsType = "ext4";
    options = [
      "user"
      "nofail"
      "exec"
      "rw"
    ];
  };
}
