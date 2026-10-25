let
  floatRule =
    class: extra:
    {
      match = { inherit class; };
      float = true;
    }
    // extra;
in
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      (floatRule "org.gnome.Loupe" { })
      (floatRule "input-remapper-gtk" { })
      (floatRule "org.fcitx." {
        size = [
          750
          500
        ];
      })
      (floatRule "org.fcitx.Fcitx5.Addon.Lotus.Settings" {
        size = [
          750
          500
        ];
      })
      (floatRule "org.kde.kdeconnect.app" {
        size = [
          750
          500
        ];
      })
      (floatRule "protonvpn-app" {
        size = [
          440
          200
        ];
      })
      (floatRule "xdg-desktop-portal-gtk" {
        size = [
          800
          600
        ];
        move = [
          25
          65
        ];
      })
    ];
  };
}
