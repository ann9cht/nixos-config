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

      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };
}
