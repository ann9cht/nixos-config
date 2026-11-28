{ pkgs, ... }:
{
  programs.onlyoffice = {
    enable = true;
    extraFontPackages = with pkgs; [
      corefonts
      vista-fonts
    ];
  };
}
