{ lib, ... }:

{
  imports = [
    ./serpantinum
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;

    extraConfig = ''
      hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

      hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
      hl.env("XDG_SESSION_TYPE", "wayland")
      hl.env("XDG_SESSION_DESKTOP", "Hyprland")
    '';

    settings = {
      monitor = [
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1.0;
        }
      ];

      config = import ./settings/config.nix;

      curve = [
        {
          _args = [
            "myBezier"
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

      bind = import ./settings/binds.nix { inherit lib; };
      on = import ./settings/autostart.nix { inherit lib; };

      animation = [
        {
          leaf = "windows";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "popin 80%";
        }
        {
          leaf = "windowsOut";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "popin 80%";
        }
        {
          leaf = "layers";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "fade";
        }
        {
          leaf = "layersIn";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "fade";
        }
        {
          leaf = "layersOut";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "fade";
        }
        {
          leaf = "fade";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
        }
        {
          leaf = "workspaces";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "slide";
        }
        {
          leaf = "specialWorkspaceIn";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "fade";
        }
        {
          leaf = "specialWorkspaceOut";
          enabled = true;
          speed = 5;
          bezier = "myBezier";
          style = "fade";
        }
      ];

      window_rule = import ./settings/rules.nix;
    };
  };
}
