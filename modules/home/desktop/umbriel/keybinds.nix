{ lib, ... }:

let
  workspaceBinds = lib.listToAttrs (
    lib.concatMap (
      n:
      let
        s = toString n;
      in
      [
        {
          name = "Mod+${s}";
          value = "workspace-switch ${s}";
        }
        {
          name = "Mod+Shift+${s}";
          value = "window-move-to-workspace ${s}";
        }
      ]
    ) (lib.range 1 9)
  );
in
{
  programs.umbriel.settings.keybinds = {
    # apps, phiên
    "Mod+Return" = {
      action = "spawn kitty";
      repeat = false;
    };
    "Mod+E" = {
      action = "spawn nautilus";
      repeat = false;
    };
    "Mod+Z" = {
      action = "spawn zen-beta";
      repeat = false;
    };
    "Mod+C" = {
      action = "spawn codium";
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

    # media, âm lượng, độ sáng
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
    "Mod+H" = "window-focus-left";
    "Mod+J" = "window-focus-down";
    "Mod+K" = "window-focus-up";
    "Mod+L" = "window-focus-right";
    "Mod+F1" = "window-focus-next";
    "Mod+Shift+Left" = "column-move-left";
    "Mod+Shift+Down" = "window-move-down";
    "Mod+Shift+Up" = "window-move-up";
    "Mod+Shift+Right" = "column-move-right";

    # trạng thái, bố cục cửa sổ
    "Mod+T" = {
      action = "window-toggle-floating";
      repeat = false;
    };
    "Mod+Shift+T" = {
      action = "window-focus-switch-floating";
      repeat = false;
    };
    "Mod+P" = {
      action = "window-toggle-pinned";
      repeat = false;
    };
    "Mod+F" = {
      action = "window-toggle-maximize";
      repeat = false;
    };
    "Mod+Ctrl+F" = {
      action = "window-toggle-maximize-to-edges";
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
    "Mod+O" = {
      action = "overview-toggle";
      repeat = false;
    };

    # scratchpad
    "Mod+Shift+Space" = {
      action = "window-move-to-scratchpad";
      repeat = false;
    };
    "Mod+D" = "scratchpad-toggle";
    "Mod+Ctrl+Space" = {
      action = "window-restore-from-scratchpad";
      repeat = false;
    };
    "Mod+Tab" = "scratchpad-focus-next";
  }
  // workspaceBinds;
}
