{ pkgs, ... }:
{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    transmission_4-gtk # torrent
  ];

  services.playerctld.enable = true;
}
