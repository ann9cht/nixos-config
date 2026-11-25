{ inputs, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.luciole.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.xdg-desktop-portal-gtk
    ];
    config.umbriel = {
      "org.freedesktop.impl.portal.FileChooser" = [ "luciole" ];
    };
  };
}
