{
  imports = [
    ./fcitx5.nix
    ./fonts.nix
    ./tweaks.nix

    ./hyprland
  ];

  programs.kdeconnect.enable = true;
}
