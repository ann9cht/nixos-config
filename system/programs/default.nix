{ ... }:

{
  imports = [
    ./fcitx5.nix
    ./fonts.nix
    ./utils.nix
    ./hyprland
  ];

  environment.pathsToLink = [ "share/thumbnailers" ]; # Xem trước ảnh HEIC 
}