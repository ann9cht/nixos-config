{ inputs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
    ./luciole.nix
    ./noctalia-greeter.nix
    ./umbriel.nix
  ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
}
