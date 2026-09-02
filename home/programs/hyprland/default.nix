{ ... }:

{
  imports = [
    ./serpantinum.nix
  ];

  wayland.windowManager.hyprland.systemd.enable = false;
  xdg.configFile."hypr".source = ./hypr;
}