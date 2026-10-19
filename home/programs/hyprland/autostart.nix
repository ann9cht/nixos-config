{ lib, ... }:

let
  commands = [
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "systemctl --user enable --now easyeffects"
    "hyprctl setcursor Bibata-Modern-Ice 24"
    "fcitx5 -d"
  ];
in
{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          ${lib.concatMapStringsSep "\n  " (c: "hl.exec_cmd(${builtins.toJSON c})") commands}
        end'')
    ];
  };
}
