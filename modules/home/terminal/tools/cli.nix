{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dust
    duf
    fd
    ripgrep

    android-tools
  ];

  programs = {
    eza.enable = true;

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
  };
}
