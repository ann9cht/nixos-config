{
  imports = [
    ./snapper.nix
  ];

  services.udisks2.enable = true; # Mount USB
}
