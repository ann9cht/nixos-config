{ inputs, ... }:
{
  imports = [
    ./nh.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ (import ../../../overlays { inherit inputs; }) ];
  };

  documentation.enable = false;

  nix = {
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
