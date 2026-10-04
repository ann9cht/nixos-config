let
  sizeMedium = [
    750
    500
  ];

  floatRule = size: class: {
    match = { inherit class; };
    float = true;
    inherit size;
  };

  floatFree = class: {
    match = { inherit class; };
    float = true;
  };
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
]
