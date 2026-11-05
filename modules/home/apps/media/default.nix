{ pkgs, ... }:

{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    # Xem ảnh
    loupe

    # Torrent
    transmission_4-gtk
  ];
}
