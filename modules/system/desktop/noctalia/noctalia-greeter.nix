{ config, vars, ... }:
let
  cursor = config.home-manager.users.${vars.username}.home.pointerCursor;
in
{
  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor = { inherit (cursor) size; };
      keyboard.layout = "us";
    };
    cursorTheme = { inherit (cursor) package name; };
  };
}
