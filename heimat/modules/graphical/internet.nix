{
  username,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.twilight];

  programs.zen-browser = {
    enable = true;
    profiles.${username} = {
      extensions.force = true;
    };
    policies = {
      AutofillAddressEnabled = true;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };

  programs.qutebrowser = {
    enable = true;
  };

  home.packages = with pkgs; [
    wiki-tui
  ];
}
