{ ... }:

{
  imports = [
    ./autostart.nix
    ./binds.nix
    ./settings.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    package = null;
    portalPackage = null;
  };
}
