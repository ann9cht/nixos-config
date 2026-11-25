{
  imports = [
    ./fcitx5.nix
    ./fonts.nix
    ./luciole.nix
    ./noctalia.nix
    ./noctalia-greeter.nix
    ./umbriel.nix
    ./xdg.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
