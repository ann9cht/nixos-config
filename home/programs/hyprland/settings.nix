let
  anim =
    leaf: extra:
    {
      inherit leaf;
      enabled = true;
      speed = 5;
      bezier = "standard";
    }
    // extra;

  curve = name: points: {
    _args = [
      name
      {
        type = "bezier";
        inherit points;
      }
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    config = {
      animations.enabled = true;

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

    curve = [
      (curve "specialWorkSwitch" [
        [
          0.05
          0.7
        ]
        [
          0.1
          1
        ]
      ])
      (curve "emphasizedAccel" [
        [
          0.3
          0
        ]
        [
          0.8
          0.15
        ]
      ])
      (curve "emphasizedDecel" [
        [
          0.05
          0.7
        ]
        [
          0.1
          1
        ]
      ])
      (curve "standard" [
        [
          0.2
          0
        ]
        [
          0
          1
        ]
      ])
    ];

    animation = [
      # layers
      (anim "layersIn" {
        speed = 5;
        bezier = "emphasizedDecel";
        style = "slide";
      })
      (anim "layersOut" {
        speed = 4;
        bezier = "emphasizedAccel";
        style = "slide";
      })
      (anim "fadeLayers" { speed = 5; })

      # windows
      (anim "windowsIn" {
        speed = 5;
        bezier = "emphasizedDecel";
      })
      (anim "windowsOut" {
        speed = 3;
        bezier = "emphasizedAccel";
      })
      (anim "windowsMove" { speed = 6; })
      (anim "workspaces" { speed = 5; })

      (anim "specialWorkspace" {
        speed = 4;
        bezier = "specialWorkSwitch";
        style = "slidefadevert 15%";
      })

      # fade / border
      (anim "fade" { speed = 6; })
      (anim "fadeDim" { speed = 6; })
      (anim "border" { speed = 6; })
    ];
  };
}
