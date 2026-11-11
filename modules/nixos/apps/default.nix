{
  imports = [
    ./fcitx5.nix
    ./steam.nix
    ./waydroid.nix
  ];

  programs.dconf.enable = true;
}
