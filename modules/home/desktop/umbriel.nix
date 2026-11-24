{ inputs, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general.autostart = [
        "noctalia"
        "fcitx5 -d"
        "kdeconnect-indicator"
      ];

      appearance.blur.radius = 3;

      input.keyboard = {
        layout = "us";
        numlock_toggle = true;
      };

      layout = {
        extent_presets = [
          0.333
          0.5
          0.667
        ];
        scrolling.default_extent_fraction = 0.5;
      };

      hot_corners.top_left = {
        enabled = true;
        delay_ms = 500;
        action = "overview-open";
      };

      keybinds = {
        # apps, phiên
        "Mod+T" = {
          action = "spawn kitty";
          repeat = false;
        };
        "Mod+B" = {
          action = "spawn kitty -e btop --utf-force";
          repeat = false;
        };
        "Mod+E" = {
          action = "spawn luciole";
          repeat = false;
        };
        "Mod+C" = {
          action = "spawn codium";
          repeat = false;
        };
        "Mod+Z" = {
          action = "spawn zen-beta";
          repeat = false;
        };
        "Mod+Space" = "spawn noctalia msg panel-toggle launcher";

        "Mod+Q" = {
          action = "window-close";
          repeat = false;
        };
        "Mod+Escape" = "session-quit";
        "Mod+Shift+Escape" = {
          action = "shortcuts-inhibit-toggle";
          allow_when_inhibited = true;
          repeat = false;
        };

        # nhạc/video, âm lượng, độ sáng
        "XF86AudioRaiseVolume" = {
          action = "spawn noctalia msg volume-up";
          allow_when_locked = true;
        };
        "XF86AudioLowerVolume" = {
          action = "spawn noctalia msg volume-down";
          allow_when_locked = true;
        };
        "XF86AudioMute" = {
          action = "spawn noctalia msg volume-mute";
          allow_when_locked = true;
          repeat = false;
        };
        "XF86AudioPlay" = {
          action = "spawn noctalia msg media toggle";
          allow_when_locked = true;
          repeat = false;
        };
        "XF86AudioNext" = {
          action = "spawn noctalia msg media next";
          allow_when_locked = true;
        };
        "XF86AudioPrev" = {
          action = "spawn noctalia msg media previous";
          allow_when_locked = true;
        };
        "XF86MonBrightnessUp" = {
          action = "spawn noctalia msg brightness-up";
          allow_when_locked = true;
        };
        "XF86MonBrightnessDown" = {
          action = "spawn noctalia msg brightness-down";
          allow_when_locked = true;
        };

        # focus, di chuyển
        "Mod+Left" = "window-focus-left";
        "Mod+Down" = "window-focus-down";
        "Mod+Up" = "window-focus-up";
        "Mod+Right" = "window-focus-right";
        "Mod+F1" = "window-focus-next";
        "Mod+Shift+Left" = "column-move-left";
        "Mod+Shift+Down" = "window-move-down";
        "Mod+Shift+Up" = "window-move-up";
        "Mod+Shift+Right" = "column-move-right";

        # bố cục, trạng thái cửa sổ
        "Mod+Alt+Space" = {
          action = "window-toggle-floating";
          repeat = false;
        };
        "Mod+Shift+Space" = {
          action = "window-focus-switch-floating";
          repeat = false;
        };
        "Mod+P" = {
          action = "window-toggle-pinned";
          repeat = false;
        };
        "Mod+M" = {
          action = "window-toggle-maximize-to-edges";
          repeat = false;
        };
        "Mod+F" = {
          action = "window-toggle-maximize";
          repeat = false;
        };
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+Minus" = "window-modify-primary-extent -0.02";
        "Mod+Equal" = "window-modify-primary-extent +0.02";
        "Mod+Ctrl+Minus" = "window-modify-secondary-extent -0.02";
        "Mod+Ctrl+Equal" = "window-modify-secondary-extent +0.02";
        "Mod+Comma" = "window-consume-left";
        "Mod+Period" = "window-consume-right";
        "Mod+Ctrl+Comma" = "window-consume-from-left";
        "Mod+Ctrl+Period" = "window-consume-from-right";
        "Mod+W" = {
          action = "column-toggle-tabbed";
          repeat = false;
        };
        "Mod+Alt+Right" = "column-focus-tab-next";
        "Mod+Alt+Left" = "column-focus-tab-previous";
        "Mod+WheelUp" = "window-focus-left";
        "Mod+WheelDown" = "window-focus-right";
        "Mod+Tab" = {
          action = "overview-toggle";
          repeat = false;
        };

        # KGLV
        "Mod+1" = "workspace-switch 1";
        "Mod+2" = "workspace-switch 2";
        "Mod+3" = "workspace-switch 3";
        "Mod+4" = "workspace-switch 4";
        "Mod+5" = "workspace-switch 5";
        "Mod+6" = "workspace-switch 6";
        "Mod+7" = "workspace-switch 7";
        "Mod+8" = "workspace-switch 8";
        "Mod+9" = "workspace-switch 9";
        "Mod+Alt+1" = "window-move-to-workspace 1";
        "Mod+Alt+2" = "window-move-to-workspace 2";
        "Mod+Alt+3" = "window-move-to-workspace 3";
        "Mod+Alt+4" = "window-move-to-workspace 4";
        "Mod+Alt+5" = "window-move-to-workspace 5";
        "Mod+Alt+6" = "window-move-to-workspace 6";
        "Mod+Alt+7" = "window-move-to-workspace 7";
        "Mod+Alt+8" = "window-move-to-workspace 8";
        "Mod+Alt+9" = "window-move-to-workspace 9";

        # Scratchpad
        "Mod+Alt+H" = {
          action = "window-move-to-scratchpad";
          repeat = false;
        };
        "Mod+H" = "scratchpad-toggle";
        "Mod+Shift+H" = {
          action = "window-restore-from-scratchpad";
          repeat = false;
        };
        "Mod+Alt+Tab" = "scratchpad-focus-next";
      };

      window_rule = [
        # Blur toàn bộ cửa sổ
        { blur = true; }

        {
          match.app_id = "^dev.noctalia.Noctalia$";
          default_floating = true;
          default_floating_size_px = {
            width = 1020;
            height = 900;
          };
        }
        {
          match.app_id = "^dev.noctalia.UmbrielSharePicker$";
          default_floating = true;
          default_floating_size_px = {
            width = 800;
            height = 600;
          };
        }
        {
          match.title = "^(Picture-in-Picture|Picture in picture)$";
          default_floating = true;
          default_maximize = false;
          default_position = {
            x = 20;
            y = 20;
            anchor = "bottom_right";
          };
        }
        {
          match.title = "^notificationtoasts_.+_desktop";
          default_position = {
            x = 0;
            y = 0;
            anchor = "bottom_right";
          };
          default_focused = false;
          default_pinned = true;
        }
      ];

      layer_rule = [
        {
          match.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_popups = true;
        }
        {
          match.namespace = "^noctalia-(notification|dock|panel|attached-panel|osd)$";
          blur_optimized = false;
        }
      ];
    };
  };
}
