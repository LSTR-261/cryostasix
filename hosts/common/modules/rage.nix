{
  inputs,
  system,
  ...
}: {
  imports = [inputs.ragenix.nixosModules.default];
  environment.systemPackages = [
    inputs.ragenix.packages.${system}.default
  ];
}
