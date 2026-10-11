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
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
