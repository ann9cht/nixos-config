{ pkgs, ... }:

let
  ski = pkgs.callPackage ../../../pkgs/ski.nix { };
in
{
  programs.ski.enable = false;

  environment.systemPackages = [ ski ];
  services.dbus.packages = [ ski ];
  xdg.portal = {
    extraPortals = [ ski ];
    config.hyprland."org.freedesktop.impl.portal.FileChooser" = [ "ski" ];
  };
}
