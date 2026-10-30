{
  imports = [
    ./nh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # rebuild nhanh hơn
  documentation = {
    doc.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
    man.enable = false;
  };

  nix = {
    channel.enable = false;
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
