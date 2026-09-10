{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      liberation_ttf
      dejavu_fonts

      # Microsoft
      corefonts
      vista-fonts

      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.fira-code
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Times New Roman"
          "Liberation Serif"
        ];
        sansSerif = [
          "Arial"
          "Liberation Sans"
        ];
        monospace = [
          "Consolas"
          "DejaVu Sans Mono"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
