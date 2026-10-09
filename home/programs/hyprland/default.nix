{ lib, ... }:

let
  bezierName = "myBezier";

  animations = {
    windows = "popin 80%";
    windowsOut = "popin 80%";
    layers = "fade";
    layersIn = "fade";
    layersOut = "fade";
    fade = null;
    workspaces = "slide";
    specialWorkspaceIn = "fade";
    specialWorkspaceOut = "fade";
  };

  mkAnimation =
    leaf: style:
    {
      inherit leaf;
      enabled = true;
      speed = 5;
      bezier = bezierName;
    }
    // lib.optionalAttrs (style != null) { inherit style; };
in
{
  imports = [ ./serpantinum ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;

    extraConfig = ''
      hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

      hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
      hl.env("XDG_SESSION_TYPE", "wayland")
      hl.env("XDG_SESSION_DESKTOP", "Hyprland")
      hl.env("GTK_USE_PORTAL", "1")
    '';

    settings = {
      config = import ./settings.nix;

      monitor = [
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1.0;
        }
      ];

      curve = [
        {
          _args = [
            bezierName
            {
              type = "bezier";
              points = [
                [
                  0.05
                  0.9
                ]
                [
                  0.1
                  1.05
                ]
              ];
            }
          ];
        }
      ];
      animation = lib.mapAttrsToList mkAnimation animations;

      bind = import ./binds.nix { inherit lib; };
      on = import ./autostart.nix { inherit lib; };
      window_rule = import ./windowrules.nix;
    };
  };
}
