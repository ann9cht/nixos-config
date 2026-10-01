{ pkgs, ... }:

{
  imports = [
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    loupe # Trình xem ảnh
  ];
}
