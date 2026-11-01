{ inputs, pkgs, ... }:

let
  hyprPkgs = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;

    package = hyprPkgs.hyprland;
    portalPackage = hyprPkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    hyprpicker # lấy mã màu
  ];
}
