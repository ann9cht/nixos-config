{ pkgs, ... }:
{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    loupe # xem ảnh
    transmission_4-gtk # torrent
  ];

  services.playerctld.enable = true;
}
