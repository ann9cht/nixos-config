{ lib }:

let
  inherit (lib.generators) mkLuaInline;
in
[
  {
    _args = [
      "hyprland.start"
      (mkLuaInline ''
        function()
          hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
          hl.exec_cmd("wl-paste --type text --watch cliphist store")
          hl.exec_cmd("wl-paste --type image --watch cliphist store")
          hl.exec_cmd("systemctl --user enable --now easyeffects")
          hl.exec_cmd("fcitx5 -d")
        end
      '')
    ];
  }
]
