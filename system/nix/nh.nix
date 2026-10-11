{
  programs.nh = {
    enable = true;
    flake = "/home/ann9cht/Projects/nixos-config";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 14d --keep 5";
    };
  };
}
