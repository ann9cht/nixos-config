{
  imports = [
    ./autostart.nix
    ./env.nix
    ./keybinds.nix
    ./monitors.nix
    ./settings.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };
}
