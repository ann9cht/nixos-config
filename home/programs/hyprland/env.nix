let
  envVar = name: value: {
    _args = [
      name
      value
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    env = [
      (envVar "XDG_CURRENT_DESKTOP" "Hyprland")
      (envVar "XDG_SESSION_TYPE" "wayland")
      (envVar "XDG_SESSION_DESKTOP" "Hyprland")
      (envVar "GTK_USE_PORTAL" "1")
    ];
  };
}
