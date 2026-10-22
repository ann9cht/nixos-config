let
  anim =
    leaf: extra:
    {
      inherit leaf;
      enabled = true;
      speed = 5;
      bezier = "myBezier";
    }
    // extra;
in
{
  wayland.windowManager.hyprland.settings = {
    config = {
      general = {
        border_size = 0;
        gaps_in = 4;
        gaps_out = 6;
        float_gaps = 6;
        resize_on_border = true;
        extend_border_grab_area = 30;
      };

      decoration = {
        rounding = 12;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          new_optimizations = true;
        };
        shadow.enabled = false;
      };

      input = {
        kb_layout = "us";
        kb_options = "grp:alt_shift_toggle";
        accel_profile = "flat";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
        numlock_by_default = true;
      };

      cursor.no_warps = true;

      # https://github.com/hyprwm/Hyprland/issues/9786
      render.send_content_type = false;

      misc = {
        focus_on_activate = false;
        font_family = "JetBrains Mono";
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };

    curve = {
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
    };

    animation = [
      (anim "windows" { style = "popin 80%"; })
      (anim "windowsOut" { style = "popin 80%"; })
      (anim "layers" { style = "fade"; })
      (anim "layersIn" { style = "fade"; })
      (anim "layersOut" { style = "fade"; })
      (anim "fade" { })
      (anim "workspaces" { style = "slide"; })
      (anim "specialWorkspaceIn" { style = "fade"; })
      (anim "specialWorkspaceOut" { style = "fade"; })
    ];
  };
}
