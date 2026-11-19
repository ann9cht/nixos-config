{
  imports = [
    ./dux-shell

    ./fonts.nix
    ./niri.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
