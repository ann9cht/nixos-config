{
  imports = [
    ./fonts.nix
    ./xdg.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
