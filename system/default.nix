{ ... }:

{
  imports = [
    ./network.nix
    ./nix.nix
    
    ./core
    ./programs
    ./services
  ];
}