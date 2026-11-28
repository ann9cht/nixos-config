{
  imports = [
    ./fcitx5.nix
    ./fonts.nix
    ./qt.nix
    ./xdg.nix

    ./noctalia
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
