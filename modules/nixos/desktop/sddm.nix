{ pkgs, ... }:
let
  themeName = "material-you";

  sddm-theme = pkgs.runCommandLocal "sddm-theme-${themeName}" { } ''
    mkdir -p $out/share/sddm/themes
    cp -r ${../../../assets/sddm/${themeName}} $out/share/sddm/themes/${themeName}
  '';
in
{
  environment.systemPackages = [ sddm-theme ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = themeName;
    extraPackages = [ pkgs.kdePackages.qt5compat ];
  };
}
