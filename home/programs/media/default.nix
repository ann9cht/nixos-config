{ pkgs, ... }:

{
  imports = [
    ./cava.nix
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    loupe # Trình xem ảnh
  ];
}