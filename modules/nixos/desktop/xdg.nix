{ pkgs, ... }:
{
  xdg.portal = {
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

    config = {
      common.default = [
        "hyprland"
        "gtk"
      ];
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "ski" ];
      };
    };
  };
}
