{
  imports = [
    #./disko.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixdesk";
}
