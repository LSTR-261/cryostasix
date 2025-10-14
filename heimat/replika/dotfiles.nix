{
  pkgs,
  inputs,
  ...
}: {
  #home.file.".config/bat" = {
  #  source = "${inputs.dotfiles}/bat";
  #  recursive = true;
  #};
  #home.file.".config/nyxt" = {
  #  source = "${inputs.dotfiles}/nyxt";
  #  recursive = true;
  #};
  ## home.file.".config/hypr" = {
  ##   source = "${inputs.dotfiles}/hypr";
  ##   recursive = true;
  ## };
  #home.file.".config/nvim" = {
  #  source = "${inputs.dotfiles}/nvim";
  #  recursive = true;
  #};
  #home.file.".config/zellij" = {
  #  source = "${inputs.dotfiles}/zellij";
  #  recursive = true;
  #};
}
