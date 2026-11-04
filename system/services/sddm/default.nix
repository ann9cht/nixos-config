{ pkgs, inputs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "material-you";
  };

  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "sddm-theme-material-you";
      src = "${inputs.serpantinum}/config/sddm/themes/material-you";
      installPhase = ''
        dest=$out/share/sddm/themes/material-you
        mkdir -p $dest
        cp -r . $dest/
      '';
    })
  ];
}
