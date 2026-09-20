{ pkgs, ... }:

{
  imports = [
    ./serpantinum.nix
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
    config.common.default = [ "hyprland" ];
  };
}
