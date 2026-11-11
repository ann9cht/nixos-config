{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config = {
      common.default = [
        "umbriel"
        "gtk"
      ];
      umbriel.default = [
        "umbriel"
        "gtk"
      ];
    };
  };
}
