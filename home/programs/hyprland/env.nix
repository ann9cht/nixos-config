{
  wayland.windowManager.hyprland.settings = {
    env = [
      {
        _args = [
          "XDG_CURRENT_DESKTOP"
          "Hyprland"
        ];
      }
      {
        _args = [
          "XDG_SESSION_TYPE"
          "wayland"
        ];
      }
      {
        _args = [
          "XDG_SESSION_DESKTOP"
          "Hyprland"
        ];
      }
      {
        _args = [
          "GTK_USE_PORTAL"
          "1"
        ];
      }
    ];
  };
}
