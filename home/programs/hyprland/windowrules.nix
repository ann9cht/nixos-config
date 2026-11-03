let
  floatRule =
    class: extra:
    {
      match = { inherit class; };
      float = true;
    }
    // extra;

  floatTitleRule =
    initial_title: extra:
    {
      match = { inherit initial_title; };
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
      (floatRule "ski-chooser" {
        size = [
          800
          600
        ];
        move = [
          25
          65
        ];
      })
      (floatRule "ski-file-manager" {
        size = [
          800
          600
        ];
        move = [
          765
          265
        ];
      })
      (floatTitleRule "^(Cài đặt|Settings)$" {
        size = [
          800
          600
        ];
        move = [
          35
          75
        ];
      })
      (floatTitleRule
        "^(Sao chép đến|Chuyển đến|Giải nén đến|Biểu tượng thư mục|Copy to|Move to|Extract to|Folder icon).*$"
        {
          size = [
            800
            600
          ];
          move = [
            35
            75
          ];
        }
      )
    ];
  };
}
