{ config, ... }:
let
  cursor = config.home-manager.users.ann9cht.home.pointerCursor;
in
{
  services.displayManager.dux-greeter = {
    enable = true;
    compositor = {
      name = "niri";
      customConfig = ''
        cursor {
          xcursor-theme "${cursor.name}"
          xcursor-size ${toString cursor.size}
        }
      '';
    };
    configHome = "/home/ann9cht";
  };

  environment.systemPackages = [ cursor.package ];
}
