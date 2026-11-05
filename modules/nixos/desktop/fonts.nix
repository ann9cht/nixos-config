{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      inter
      roboto
      noto-fonts

      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code

      corefonts
      vista-fonts
    ];

    fontconfig.defaultFonts = {
      sansSerif = [
        "Inter"
        "Noto Sans"
        "Noto Sans CJK SC"
      ];
      serif = [
        "Noto Serif"
        "Liberation Serif"
        "Noto Serif CJK SC"
      ];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Noto Sans Mono"
      ];
    };
  };
}
