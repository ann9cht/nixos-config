{
  imports = [
    ./fonts.nix
    ./hyprland.nix
    ./sddm-theme.nix
    ./serpantinum.nix
    ./xdg.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
