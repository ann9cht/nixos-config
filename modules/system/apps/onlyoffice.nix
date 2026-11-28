{ pkgs, ... }:
{
  # onlyoffice-desktopeditors --system-title-bar
  programs.onlyoffice = {
    enable = true;
    extraFontPackages = with pkgs; [
      corefonts
      vista-fonts
    ];
  };
}
