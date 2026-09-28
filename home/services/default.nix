{
  imports = [
    ./kdeconnect.nix
    ./remapper.nix
  ];

  services.playerctld.enable = true;
}
