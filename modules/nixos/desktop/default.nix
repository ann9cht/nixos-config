{
  imports = [
    ./fonts.nix
    ./hyprland.nix
    ./sddm.nix
    ./xdg.nix
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };
}
