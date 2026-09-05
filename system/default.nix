{ ... }:

{
  imports = [
    ./network.nix
    ./nix.nix
    ./services.nix
    ./core
    ./programs
  ];
}