let
  floatFree = class: {
    match = { inherit class; };
    float = true;
  };

  floatRule = size: class: {
    match = { inherit class; };
    float = true;
    inherit size;
  };

  floatRuleAt = size: move: class: {
    match = { inherit class; };
    float = true;
    inherit size move;
  };

  sizeMedium = [
    750
    500
  ];
in

map floatFree [
  "org.gnome.Loupe"
  "input-remapper-gtk"
]

++ map (floatRule sizeMedium) [
  "org.fcitx."
  "org.fcitx.Fcitx5.Addon.Lotus.Settings"
  "org.kde.kdeconnect.app"
]

++ [
  (floatRule [ 440 200 ] "protonvpn-app")
  (floatRuleAt [ 800 600 ] [ 25 65 ] "xdg-desktop-portal-gtk")
]
