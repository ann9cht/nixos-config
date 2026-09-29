{ lib }:

let
  inherit (lib.generators) mkLuaInline toLua;
  lua = toLua { };

  mainMod = "SUPER";
  terminal = "kitty";
  terminalMini = "[float; size 630 380; move 35 75] kitty";
  file = "nautilus";
  fileMini = "[float; size 800 600; move 765 265] dbus-run-session nautilus";
  browser = "firefox";
  editor = "codium";

  b = keys: dsp: {
    _args = [
      keys
      dsp
    ];
  };
  withOpts = opts: keys: dsp: {
    _args = [
      keys
      dsp
      opts
    ];
  };
  bLocked = withOpts { locked = true; };
  bRepeat = withOpts { repeating = true; };
  bLockedRepeat = withOpts {
    locked = true;
    repeating = true;
  };
  bMouse = withOpts { mouse = true; };

  exec = cmd: mkLuaInline "hl.dsp.exec_cmd(${lua cmd})";
  serp = args: exec "serpantinum ${args}";
  focusDir = d: mkLuaInline "hl.dsp.focus({ direction = ${lua d} })";
  moveDir = d: mkLuaInline "hl.dsp.window.move({ direction = ${lua d} })";
  focusWs = ws: mkLuaInline "hl.dsp.focus({ workspace = ${lua ws} })";
  resizeBy =
    x: y: mkLuaInline "hl.dsp.window.resize({ x = ${toString x}, y = ${toString y}, relative = true })";
in
[
  # Đổi kích thước bằng chuột
  (bMouse "${mainMod} + mouse:272" (mkLuaInline "hl.dsp.window.drag()"))
  (bMouse "${mainMod} + mouse:273" (mkLuaInline "hl.dsp.window.resize()"))

  # Đổi kích thước bằng phím
  (bRepeat "${mainMod} + SHIFT + Left" (resizeBy (-50) 0))
  (bRepeat "${mainMod} + SHIFT + Right" (resizeBy 50 0))
  (bRepeat "${mainMod} + SHIFT + Up" (resizeBy 0 (-50)))
  (bRepeat "${mainMod} + SHIFT + Down" (resizeBy 0 50))

  # Di chuyển cửa sổ
  (b "${mainMod} + CTRL + Left" (moveDir "l"))
  (b "${mainMod} + CTRL + Right" (moveDir "r"))
  (b "${mainMod} + CTRL + Up" (moveDir "u"))
  (b "${mainMod} + CTRL + Down" (moveDir "d"))

  # Đổi focus
  (b "${mainMod} + Left" (focusDir "left"))
  (b "${mainMod} + Right" (focusDir "right"))
  (b "${mainMod} + Up" (focusDir "up"))
  (b "${mainMod} + Down" (focusDir "down"))

  # Cửa sổ
  (b "${mainMod} + Q" (mkLuaInline "hl.dsp.window.close()"))
  (b "${mainMod} + F" (
    mkLuaInline ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })''
  ))
  (b "${mainMod} + ALT + SPACE" (mkLuaInline ''hl.dsp.window.float({ action = "toggle" })''))

  # Độ sáng
  (bLocked "XF86MonBrightnessDown" (serp "brightness lower"))
  (bLocked "XF86MonBrightnessUp" (serp "brightness raise"))

  # Chụp màn hình
  (bLocked "Print" (serp "screenshot"))
  (bLocked "SHIFT + Print" (serp "screenshot --edit"))
  (bLocked "SUPER + SHIFT + S" (serp "screenshot --edit"))
  (bLocked "SUPER + Print" (serp "screenshot --full"))
  (bLocked "SUPER + P" (serp "screenshot --full"))
  (bLocked "SUPER + SHIFT + Print" (serp "screenshot --full --edit"))
  (bLocked "SUPER + SHIFT + P" (serp "screenshot --full --edit"))

  # Khóa phiên
  (bLocked "XF86PowerOff" (serp "lock"))
  (bLockedRepeat "${mainMod} + L" (serp "lock"))

  # Media
  (bLocked "${mainMod} + ALT" (exec "playerctl play-pause"))
  (bLocked "XF86AudioPause" (exec "playerctl play-pause"))
  (bLocked "XF86AudioPlay" (exec "playerctl play-pause"))
  (bLocked "XF86AudioPrev" (exec "playerctl previous"))
  (bLocked "XF86AudioNext" (exec "playerctl next"))
  (bLocked "XF86AudioMicMute" (serp "volume mic-toggle"))
  (bLocked "XF86AudioMute" (serp "volume mute-toggle"))
  (bLockedRepeat "XF86AudioLowerVolume" (serp "volume lower"))
  (bLockedRepeat "XF86AudioRaiseVolume" (serp "volume raise"))

  # Mở app thường ngày
  (b "${mainMod} + T" (exec terminal))
  (b "${mainMod} + ALT + Q" (exec terminalMini))
  (b "${mainMod} + E" (exec file))
  (b "${mainMod} + ALT + E" (exec fileMini))
  (b "${mainMod} + Z" (exec browser))
  (b "${mainMod} + C" (exec editor))
  (b "${mainMod} + W" (exec "waydroid show-full-ui"))
  (b "${mainMod} + ALT + W" (exec "waydroid session stop"))
  (b "${mainMod} + O" (exec "obsidian"))

  # Serpantinum
  (b "${mainMod} + R" (serp "reload"))
  (b "${mainMod} + V" (serp "msg toggle clipboard"))
  (b "${mainMod} + SPACE" (serp "msg toggle launcher"))
  (b "${mainMod} + M" (serp "msg toggle music"))
  (b "${mainMod} + N" (serp "msg toggle system"))
  (b "${mainMod} + SHIFT + W" (serp "msg toggle wallpaper"))
  (b "${mainMod} + SHIFT + C" (serp "msg toggle calendar"))
  (b "${mainMod} + D" (serp "msg toggle network"))
  (b "${mainMod} + S" (serp "msg toggle volume"))
  (b "${mainMod} + comma" (serp "msg toggle guide"))
  (b "${mainMod} + A" (serp "msg toggle autohide"))
]

# Chuyển KGLV
++ lib.concatMap (
  i:
  let
    ws = toString i;
    key = toString (lib.mod i 10); # 10 thành phím 0
  in
  [
    (b "${mainMod} + ${key}" (serp "msg workspace ${ws}"))
    (b "${mainMod} + ALT + ${key}" (serp "msg workspace ${ws} move"))
  ]
) (lib.range 1 10)

++ [
  (b "${mainMod} + mouse_up" (focusWs "-1"))
  (b "${mainMod} + mouse_down" (focusWs "+1"))
]
