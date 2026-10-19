{ ... }:

{
  imports = [
    ./autostart.nix
    ./binds.nix
    ./settings.nix
    ./windowrules.nix

    ./serpantinum
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    package = null;
    portalPackage = null;
  };
}
