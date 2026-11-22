{ vars, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./caelestia-test.nix
    ./umbriel-test.nix
  ];

  networking.hostName = vars.host;
}
