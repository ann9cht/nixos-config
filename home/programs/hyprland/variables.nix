let
  terminal = "kitty";
  file = "nautilus";
in
{
  mainMod = "SUPER";
  inherit terminal file;
  browser = "zen-beta";
  editor = "codium";

  terminalMini = "[float; size 630 380; move 35 75] ${terminal}";
  fileMini = "[float; size 800 600; move 765 265] dbus-run-session ${file}";
}
