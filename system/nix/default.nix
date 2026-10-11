{
  imports = [
    ./nh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    optimise = {
      automatic = true;
      dates = "Sun 20:00";
    };

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
