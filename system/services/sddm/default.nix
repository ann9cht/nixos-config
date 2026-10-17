{ pkgs, inputs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "material-you";
    extraPackages = [ pkgs.kdePackages.qt5compat ];
  };

  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "sddm-theme-material-you";
      src = "${inputs.serpantinum}/config/sddm/themes/material-you";
      patches = [ ./sddm-theme-material-you.patch ];
      installPhase = ''
        dest=$out/share/sddm/themes/material-you
        cp ${./bg.png} bg.png
        mkdir -p $dest
        cp -r . $dest/
      '';
    })
  ];
}
