{ lib, ... }:

let
  dsp = s: lib.generators.mkLuaInline "hl.dsp.${s}";
  exec = cmd: dsp ''exec_cmd("${cmd}")'';

  bind = keys: action: opts: {
    _args = [
      keys
      action
    ]
    ++ lib.optional (opts != { }) opts;
  };

  locked = {
    locked = true;
  };
  repeating = {
    repeating = true;
  };
  lockedRepeating = {
    locked = true;
    repeating = true;
  };
  mouse = {
    mouse = true;
  };

  mod = "SUPER";
  terminal = "kitty";
  file = "nautilus";
  browser = "zen-beta";
  editor = "codium";

  terminalMini = "[float; size 630 380; move 35 75] ${terminal}";
  fileMini = "[float; size 800 600; move 765 265] dbus-run-session ${file}";
in
{
  wayland.windowManager.hyprland.settings = {
    gesture = {
      fingers = 3;
      direction = "horizontal";
      action = "workspace";
    };

    bind = [
      # chuột
      (bind "${mod} + mouse:272" (dsp "window.drag()") mouse)
      (bind "${mod} + mouse:273" (dsp "window.resize()") mouse)

      # resize cửa sổ
      (bind "${mod} + SHIFT + Left" (dsp "window.resize({ x = -50, y = 0, relative = true })") repeating)
      (bind "${mod} + SHIFT + Right" (dsp "window.resize({ x = 50, y = 0, relative = true })") repeating)
      (bind "${mod} + SHIFT + Up" (dsp "window.resize({ x = 0, y = -50, relative = true })") repeating)
      (bind "${mod} + SHIFT + Down" (dsp "window.resize({ x = 0, y = 50, relative = true })") repeating)

      # di chuyển cửa sổ
      (bind "${mod} + CTRL + Left" (dsp ''window.move({ direction = "l" })'') { })
      (bind "${mod} + CTRL + Right" (dsp ''window.move({ direction = "r" })'') { })
      (bind "${mod} + CTRL + Up" (dsp ''window.move({ direction = "u" })'') { })
      (bind "${mod} + CTRL + Down" (dsp ''window.move({ direction = "d" })'') { })

      # focus
      (bind "${mod} + Left" (dsp ''focus({ direction = "left" })'') { })
      (bind "${mod} + Right" (dsp ''focus({ direction = "right" })'') { })
      (bind "${mod} + Up" (dsp ''focus({ direction = "up" })'') { })
      (bind "${mod} + Down" (dsp ''focus({ direction = "down" })'') { })

      (bind "${mod} + mouse_up" (dsp ''focus({ workspace = "-1" })'') { })
      (bind "${mod} + mouse_down" (dsp ''focus({ workspace = "+1" })'') { })

      # cửa sổ
      (bind "${mod} + Q" (dsp "window.close()") { })
      (bind "${mod} + F" (dsp ''window.fullscreen({ mode = "maximized", action = "toggle" })'') { })
      (bind "${mod} + ALT + SPACE" (dsp ''window.float({ action = "toggle" })'') { })

      # độ sáng
      (bind "XF86MonBrightnessDown" (exec "serpantinum brightness lower") locked)
      (bind "XF86MonBrightnessUp" (exec "serpantinum brightness raise") locked)

      # chụp màn hình
      (bind "Print" (exec "serpantinum screenshot") locked)
      (bind "SHIFT + Print" (exec "serpantinum screenshot --edit") locked)
      (bind "${mod} + SHIFT + S" (exec "serpantinum screenshot --edit") locked)
      (bind "${mod} + Print" (exec "serpantinum screenshot --full") locked)
      (bind "${mod} + SHIFT + Print" (exec "serpantinum screenshot --full --edit") locked)

      # khóa
      (bind "XF86PowerOff" (exec "serpantinum lock") locked)
      (bind "${mod} + L" (exec "serpantinum lock") lockedRepeating)

      # phương tiện
      (bind "XF86AudioPause" (exec "playerctl play-pause") locked)
      (bind "XF86AudioPlay" (exec "playerctl play-pause") locked)
      (bind "XF86AudioPrev" (exec "playerctl previous") locked)
      (bind "XF86AudioNext" (exec "playerctl next") locked)
      (bind "XF86AudioMicMute" (exec "serpantinum volume mic-toggle") locked)
      (bind "XF86AudioMute" (exec "serpantinum volume mute-toggle") locked)
      (bind "XF86AudioLowerVolume" (exec "serpantinum volume lower") lockedRepeating)
      (bind "XF86AudioRaiseVolume" (exec "serpantinum volume raise") lockedRepeating)

      # phần mềm hay dùng
      (bind "${mod} + W" (exec browser) { })
      (bind "${mod} + E" (exec file) { })
      (bind "${mod} + ALT + E" (exec fileMini) { })
      (bind "${mod} + T" (exec terminal) { })
      (bind "${mod} + ALT + Q" (exec terminalMini) { })
      (bind "${mod} + C" (exec editor) { })

      (bind "${mod} + ALT + W" (exec "waydroid session stop") { })
      (bind "${mod} + O" (exec "obsidian") { })
      (bind "${mod} + SHIFT + Z" (exec "chromium") { })

      (bind "${mod} + Z" (exec "/home/ann9cht/Programs/Zalo-*.AppImage") { })
      (bind "${mod} + X" (exec "/home/ann9cht/Programs/artcraft-launcher-*.AppImage") { })

      # serp
      (bind "${mod} + R" (exec "serpantinum reload") { })
      (bind "${mod} + V" (exec "serpantinum msg toggle clipboard") { })
      (bind "${mod} + SPACE" (exec "serpantinum msg toggle launcher") { })
      (bind "${mod} + M" (exec "serpantinum msg toggle music") { })
      (bind "${mod} + N" (exec "serpantinum msg toggle system") { })
      (bind "${mod} + SHIFT + W" (exec "serpantinum msg toggle wallpaper") { })
      (bind "${mod} + SHIFT + C" (exec "serpantinum msg toggle calendar") { })
      (bind "${mod} + D" (exec "serpantinum msg toggle network") { })
      (bind "${mod} + S" (exec "serpantinum msg toggle volume") { })
      (bind "${mod} + comma" (exec "serpantinum msg toggle guide") { })
      (bind "${mod} + A" (exec "serpantinum msg toggle autohide") { })
    ]
    ++ lib.concatMap (
      i:
      let
        ws = toString i;
        key = toString (lib.mod i 10);
      in
      [
        (bind "${mod} + ${key}" (exec "serpantinum msg workspace ${ws}") { })
        (bind "${mod} + ALT + ${key}" (exec "serpantinum msg workspace ${ws} move") { })
      ]
    ) (lib.range 1 10);
  };
}
