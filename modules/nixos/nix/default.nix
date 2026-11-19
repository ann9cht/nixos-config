{
  imports = [
    ./nh.nix
  ];

  nix.settings = {
    auto-optimise-store = true;
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  documentation.enable = false;

  nixpkgs.config.allowUnfree = true;
}
