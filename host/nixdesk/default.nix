{ vars, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./caelestia-test.nix
  ];

  networking.hostName = vars.host;
}
