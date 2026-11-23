{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config.umbriel = {
      default = [
        "umbriel"
        "gtk"
      ];
    };
  };
}
