{
  imports = [
    ./nh.nix
    ./substituters.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # tắt mấy cái k dùng
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
    };
  };
}
