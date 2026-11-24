{ inputs, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.luciole.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [
        "luciole"
        "gtk"
      ];
    };
  };
}
