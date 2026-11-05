{ vars, ... }:
{
  programs.nh = {
    enable = true;
    flake = vars.flakePath;

    clean = {
      enable = true;
      dates = "Sun 20:00";
      extraArgs = "--keep-since 14d --keep 5 --keep-one";
    };
  };
}
