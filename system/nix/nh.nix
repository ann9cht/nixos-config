{
  programs.nh = {
    enable = true;
    flake = "/home/ann9cht/GitHub/nixos-config";

    clean = {
      enable = true;
      dates = "Sun 20:00";
      extraArgs = "--keep-since 14d --keep 5 --keep-one";
    };
  };
}
