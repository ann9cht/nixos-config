{ pkgs, ... }:
{
  programs.onlyoffice = {
    enable = true;
    extraFontPackages = with pkgs; [
      corefonts
      vista-fonts
    ];
  };

  environment.systemPackages = with pkgs; [ euro-office-desktopeditors ];
}
