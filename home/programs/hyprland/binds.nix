{ lib, ... }:

let
  vars = import ./variables.nix;
  h = import ./helpers.nix { inherit lib; };
  inherit (h)
    lua
    exec
    m
    bind
    bindWith
    locked
    repeating
    lockedRepeating
    ;
  inherit (vars)
    browser
    file
    fileMini
    terminal
    terminalMini
    editor
    ;

  workspaceBinds = lib.concatMap (
    i:
    let
      ws = toString i;
      key = toString (lib.mod i 10);
    in
    [
      (bind (m key) (exec "serpantinum msg workspace ${ws}"))
      (bind (m "ALT + ${key}") (exec "serpantinum msg workspace ${ws} move"))
    ]
  ) (lib.range 1 10);
in
{
  wayland.windowManager.hyprland.settings = {
    gesture = {
      fingers = 3;
      direction = "horizontal";
      action = "workspace";
    };

    bind = [
      # Chuột
      (bindWith (m "mouse:272") (lua "hl.dsp.window.drag()") { mouse = true; })
      (bindWith (m "mouse:273") (lua "hl.dsp.window.resize()") { mouse = true; })

      # Resize cửa sổ
      (bindWith (m "SHIFT + Left") (lua "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
        repeating
      )
      (bindWith (m "SHIFT + Right") (lua "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
        repeating
      )
      (bindWith (m "SHIFT + Up") (lua "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
        repeating
      )
      (bindWith (m "SHIFT + Down") (lua "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
        repeating
      )

      # Di chuyển cửa sổ
      (bind (m "CTRL + Left") (lua ''hl.dsp.window.move({ direction = "l" })''))
      (bind (m "CTRL + Right") (lua ''hl.dsp.window.move({ direction = "r" })''))
      (bind (m "CTRL + Up") (lua ''hl.dsp.window.move({ direction = "u" })''))
      (bind (m "CTRL + Down") (lua ''hl.dsp.window.move({ direction = "d" })''))

      # Focus
      (bind (m "Left") (lua ''hl.dsp.focus({ direction = "left" })''))
      (bind (m "Right") (lua ''hl.dsp.focus({ direction = "right" })''))
      (bind (m "Up") (lua ''hl.dsp.focus({ direction = "up" })''))
      (bind (m "Down") (lua ''hl.dsp.focus({ direction = "down" })''))

      (bind (m "mouse_up") (lua ''hl.dsp.focus({ workspace = "-1" })''))
      (bind (m "mouse_down") (lua ''hl.dsp.focus({ workspace = "+1" })''))

      # Cửa sổ
      (bind (m "Q") (lua "hl.dsp.window.close()"))
      (bind (m "F") (lua ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })''))
      (bind (m "ALT + SPACE") (lua ''hl.dsp.window.float({ action = "toggle" })''))

      # Độ sáng
      (bindWith "XF86MonBrightnessDown" (exec "serpantinum brightness lower") locked)
      (bindWith "XF86MonBrightnessUp" (exec "serpantinum brightness raise") locked)

      # Chụp màn hình
      (bindWith "Print" (exec "serpantinum screenshot") locked)
      (bindWith "SHIFT + Print" (exec "serpantinum screenshot --edit") locked)
      (bindWith (m "SHIFT + S") (exec "serpantinum screenshot --edit") locked)
      (bindWith (m "Print") (exec "serpantinum screenshot --full") locked)
      (bindWith (m "SHIFT + Print") (exec "serpantinum screenshot --full --edit") locked)

      # Khóa / nguồn
      (bindWith "XF86PowerOff" (exec "serpantinum lock") locked)
      (bindWith (m "L") (exec "serpantinum lock") lockedRepeating)

      # Media
      (bindWith "XF86AudioPause" (exec "playerctl play-pause") locked)
      (bindWith "XF86AudioPlay" (exec "playerctl play-pause") locked)
      (bindWith "XF86AudioPrev" (exec "playerctl previous") locked)
      (bindWith "XF86AudioNext" (exec "playerctl next") locked)
      (bindWith "XF86AudioMicMute" (exec "serpantinum volume mic-toggle") locked)
      (bindWith "XF86AudioMute" (exec "serpantinum volume mute-toggle") locked)
      (bindWith "XF86AudioLowerVolume" (exec "serpantinum volume lower") lockedRepeating)
      (bindWith "XF86AudioRaiseVolume" (exec "serpantinum volume raise") lockedRepeating)

      # Phần mềm hay dùng
      (bind (m "Z") (exec browser))
      (bind (m "E") (exec file))
      (bind (m "ALT + E") (exec fileMini))
      (bind (m "T") (exec terminal))
      (bind (m "ALT + Q") (exec terminalMini))
      (bind (m "C") (exec editor))

      (bind (m "W") (exec "waydroid show-full-ui"))
      (bind (m "ALT + W") (exec "waydroid session stop"))
      (bind (m "O") (exec "obsidian"))
      (bind (m "SHIFT + Z") (exec "chromium"))

      # Serpantinum
      (bind (m "R") (exec "serpantinum reload"))
      (bind (m "V") (exec "serpantinum msg toggle clipboard"))
      (bind (m "SPACE") (exec "serpantinum msg toggle launcher"))
      (bind (m "M") (exec "serpantinum msg toggle music"))
      (bind (m "N") (exec "serpantinum msg toggle system"))
      (bind (m "SHIFT + W") (exec "serpantinum msg toggle wallpaper"))
      (bind (m "SHIFT + C") (exec "serpantinum msg toggle calendar"))
      (bind (m "D") (exec "serpantinum msg toggle network"))
      (bind (m "S") (exec "serpantinum msg toggle volume"))
      (bind (m "comma") (exec "serpantinum msg toggle guide"))
      (bind (m "A") (exec "serpantinum msg toggle autohide"))
    ]
    ++ workspaceBinds;
  };
}
