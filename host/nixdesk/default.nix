{ vars, ...}
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = vars.host;
}
