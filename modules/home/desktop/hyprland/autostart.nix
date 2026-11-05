{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;

  autostart = [
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "serpantinumd start"
    "fcitx5 -d"
  ];
in
{
  wayland.windowManager.hyprland.settings = {
    on = {
      _args = [
        "hyprland.start"
        (lua ''
          function()
          ${lib.concatMapStringsSep "\n" (c: ''hl.exec_cmd("${c}")'') autostart}
          end
        '')
      ];
    };
  };
}
