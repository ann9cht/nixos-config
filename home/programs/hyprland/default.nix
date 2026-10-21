{
  imports = [
    ./calestia.nix
  ];

  wayland.windowManager.hyprland = {
    systemd.enable = false;

    package = null;
    portalPackage = null;
  };
}
