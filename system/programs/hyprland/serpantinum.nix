{ pkgs, inputs, ... }:

{
  programs.serpantinum.enable = true;

  environment.systemPackages = with pkgs; [
    (stdenv.mkDerivation {
      name = "sddm-theme-material-you";
      src = "${inputs.serpantinum}/config/sddm/themes/material-you";
      installPhase = ''
        mkdir -p $out/share/sddm/themes/material-you
        cp -r * $out/share/sddm/themes/material-you/
      '';
    })
    # Chụp màn hình (pactl)
    pulseaudio

    # Bảng nhớ tạm
    cliphist
    wl-clipboard
  ];
}
