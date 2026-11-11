{ pkgs, ... }:
{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    loupe # xem ảnh
    evince # xem pdf
    transmission_4-gtk # torrent
  ];
}
