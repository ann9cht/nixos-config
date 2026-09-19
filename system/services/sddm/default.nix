{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "material-you";
    extraPackages = with pkgs.kdePackages; [
      qt5compat
      qtsvg
      qtdeclarative
      qtwayland
    ];
  };

  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "sddm-theme-material-you";
      src = ./themes;
      installPhase = ''
        mkdir -p $out/share/sddm/themes/material-you
        cp -r * $out/share/sddm/themes/material-you/
      '';
    })
  ];
}
