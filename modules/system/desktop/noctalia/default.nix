{ inputs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
    ./luciole.nix
    ./umbriel.nix
  ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
}
