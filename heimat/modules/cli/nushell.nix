{
  config,
  lib,
  username,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.cli.nushell;
in {
  options.modules.cli.nushell.enable = mkEnableOption "enable nushell";

  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      envFile.text = ''
        $env.config.show_banner = false
        $env.config.completions = {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"
          external: {
            enable: true
            max_results: 100
            completer: {| spans | carapace $spans.0 nushell ...$spans | from json}
          }
        }
        $env.config.keybindings ++= [{name:"unfreeze",modifier:control,keycode:"char_z",event:{send:executehostcommand,cmd:"job unfreeze"},mode:emacs}]
        $env.config.hooks.command_not_found = source ${pkgs.nix-index}/etc/profile.d/command-not-found.nu
        $env.EDITOR = "hx"
      '';
      configFile.text = ''
        alias  .. = cd ..
        alias ... = cd ...
        alias   c = cd /home/${username}/.config/cryostasix
        alias   b = yazi
        alias  lt = eza --tree --level=2 --long --icons --git
        alias  tr = broot
        alias  lg = lazygit
        alias   n = nix
        alias  ns = tv nix-search-tv
        alias  nr = nix run nixpkgs#
        alias  nd = nix develop -c $nu.current-shell
        alias nfu = nix flake update

        alias  rb = nh os switch /home/${username}/.config/cryostasix
        alias   v = hx
        alias   x = sudo rm -rf
      '';
    };
  };
}
