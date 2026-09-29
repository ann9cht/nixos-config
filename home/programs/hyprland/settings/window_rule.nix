let
  size45 = [
    "(monitor_w*0.45)"
    "(monitor_h*0.45)"
  ];
  sizeSmall = [
    440
    200
  ];
  sizeLarge = [
    750
    500
  ];

  floatRule = size: class: {
    match = { inherit class; };
    float = true;
    inherit size;
  };
in

map (floatRule size45) [
  "org.gnome.Loupe"
  "input-remapper-gtk"
]

++ map (floatRule sizeLarge) [
  "org.fcitx."
  "org.fcitx.Fcitx5.Addon.Lotus.Settings"
  "org.kde.kdeconnect.app"
]

++ [
  (floatRule sizeSmall "protonvpn-app")
]
